import mysql.connector
from faker import Faker
import random

fake = Faker()

# Configuration MySQL
config = {
    'user': 'retail_user',
    'password': 'retail_pass',
    'host': 'localhost',
    'database': 'retail_db',
    'port': 3306
}

def generate_data(num_clients=10, num_produits=10, num_commandes=20):
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()

    # Générer des clients
    for _ in range(num_clients):
        first_name = fake.first_name()
        last_name = fake.last_name()
        email = fake.email()
        cursor.execute("""
            INSERT INTO clients (first_name, last_name, email)
            VALUES (%s, %s, %s)
        """, (first_name, last_name, email))
    conn.commit()

    # Générer des produits
    categories = ['Electronics', 'Fashion', 'Home', 'Books', 'Food']
    for _ in range(num_produits):
        name = fake.word().title()
        category = random.choice(categories)
        price = round(random.uniform(5, 200), 2)
        cursor.execute("""
            INSERT INTO produits (name, category, price)
            VALUES (%s, %s, %s)
        """, (name, category, price))
    conn.commit()

    # Récupérer IDs pour générer des commandes
    cursor.execute("SELECT client_id FROM clients")
    client_ids = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT produit_id FROM produits")
    produit_ids = [row[0] for row in cursor.fetchall()]

    # Générer commandes
    for _ in range(num_commandes):
        client_id = random.choice(client_ids)
        produit_id = random.choice(produit_ids)
        quantity = random.randint(1, 5)
        cursor.execute("SELECT price FROM produits WHERE produit_id = %s", (produit_id,))
        price = cursor.fetchone()[0]
        total_amount = round(price * quantity, 2)

        cursor.execute("""
            INSERT INTO commandes (client_id, produit_id, quantity, total_amount)
            VALUES (%s, %s, %s, %s)
        """, (client_id, produit_id, quantity, total_amount))

    conn.commit()
    cursor.close()
    conn.close()

if __name__ == "__main__":
    generate_data()
    print("Données générées avec succès !")

import pandas as pd
from faker import Faker
import random

fake = Faker()

# Générer les données de produits
def generate_products(n):
    products = []
    for _ in range(n):
        products.append({
            'product_id': fake.uuid4(),
            'product_name': fake.word(),
            'category': random.choice(['Electronics', 'Clothing', 'Home', 'Books']),
            'price': round(random.uniform(10.0, 100.0), 2)
        })
    return pd.DataFrame(products)

# Générer les données de clients
def generate_customers(n):
    customers = []
    for _ in range(n):
        customers.append({
            'customer_id': fake.uuid4(),
            'name': fake.name(),
            'email': fake.email(),
            'country': fake.country()
        })
    return pd.DataFrame(customers)

# Générer les données de commandes
def generate_orders(n, products_df, customers_df):
    orders = []
    for _ in range(n):
        order = {
            'order_id': fake.uuid4(),
            'customer_id': random.choice(customers_df['customer_id']),
            'product_id': random.choice(products_df['product_id']),
            'quantity': random.randint(1, 5),
            'total_price': 0,  # sera calculé ensuite
            'order_date': fake.date_this_year()
        }
        product = products_df[products_df['product_id'] == order['product_id']].iloc[0]
        order['total_price'] = order['quantity'] * product['price']
        orders.append(order)
    return pd.DataFrame(orders)

# Génération des jeux de données
products_df = generate_products(500)  # 100 produits
customers_df = generate_customers(120)  # 50 clients
orders_df = generate_orders(700, products_df, customers_df)  # 200 commandes

# Sauvegarde des fichiers CSV
products_df.to_csv('products.csv', index=False)
customers_df.to_csv('customers.csv', index=False)
orders_df.to_csv('orders.csv', index=False)

print("Les données ont été générées et sauvegardées dans des fichiers CSV.")

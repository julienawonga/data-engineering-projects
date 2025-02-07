import pandas as pd
from faker import Faker
import random

fake = Faker()

# Générer les données de produits
def generate_products(n):
    products = []
    for i in range(n):
        products.append({
            'product_id': i,
            'product_name': fake.word(),
            'category': random.choice(['Electronics', 'Clothing', 'Home', 'Books']),
            'price': round(random.uniform(10.0, 100.0), 2)
        })
    return pd.DataFrame(products)

# Générer les données de clients
def generate_customers(n):
    customers = []
    for i in range(n):
        customers.append({
            'customer_id': i,
            'name': fake.name(),
            'email': fake.email(),
            'country': fake.country()
        })
    return pd.DataFrame(customers)

# Générer les données de commandes
def generate_orders(n, products_df, customers_df):
    orders = []
    for i in range(n):
        order = {
            'order_id': i,
            'customer_id': random.choice(customers_df['customer_id']),
            'product_id': random.choice(products_df['product_id']),
            'quantity': random.randint(0, 5),
            'total_price': 0,
            'order_date': fake.date_this_year()
        }
        product = products_df[products_df['product_id'] == order['product_id']].iloc[0]
        order['total_price'] = order['quantity'] * product['price']
        orders.append(order)
    return pd.DataFrame(orders)

# Génération des jeux de données
products_df = generate_products(9) 
customers_df = generate_customers(6)
orders_df = generate_orders(40, products_df, customers_df)

# Sauvegarde des fichiers CSV
products_df.to_csv('./csv_data/products.csv', index=False)
customers_df.to_csv('./csv_data/customers.csv', index=False)
orders_df.to_csv('./csv_data/orders.csv', index=False)

print("Les données ont été générées et sauvegardées dans des fichiers CSV.")

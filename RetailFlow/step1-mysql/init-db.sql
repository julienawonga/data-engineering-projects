USE retail_db;

-- Table CLIENTS
CREATE TABLE IF NOT EXISTS clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table PRODUITS
CREATE TABLE IF NOT EXISTS produits (
    produit_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table COMMANDES
CREATE TABLE IF NOT EXISTS commandes (
    commande_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    produit_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_client
      FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_produit
      FOREIGN KEY (produit_id) REFERENCES produits(produit_id)
);

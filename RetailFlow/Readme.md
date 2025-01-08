# 📚 README.md — Projet RetailFlow : Stack Data Engineering

## 🚀 1. Introduction

**RetailFlow** est un projet de **Data Engineering complet** conçu pour simuler le traitement, l'intégration, la transformation, et l'analyse de données dans le secteur du **retail (commerce de détail)**. Ce projet illustre comment collecter, centraliser et analyser des données transactionnelles et des fichiers externes (CSV) à l'aide d'une stack moderne de **Data Engineering open-source**, déployée localement avec **Docker**.

### 🎯 Objectif du Projet :
* **Intégrer des données transactionnelles MySQL** (données clients, produits, commandes).  
* **Importer des données externes via un fichier CSV** (localisation des magasins).  
* **Stocker les données dans un Data Warehouse (PostgreSQL)**.  
* **Orchestrer les flux de données avec Airflow**.  
* **Transformer et modéliser les données avec dbt**.  
* **Visualiser les insights avec Apache Superset**.  
* **Documenter et gouverner les données avec OpenMetadata**.

---

## 🏢 2. Contexte Métier : Cas d'Usage Retail

### 📊 Scénario : Vente en ligne et magasins physiques

Une chaîne de magasins de détail opérant à la fois en ligne et en physique souhaite mieux comprendre ses ventes, ses clients et ses magasins. Pour cela, elle a besoin de :

* **Données transactionnelles (MySQL)** : Commandes clients en ligne (produits achetés, montants, date).  
* **Données externes (CSV)** : Informations géographiques sur les magasins physiques (ville, région, pays).  
* **Centralisation dans un entrepôt de données (PostgreSQL)** pour analyse et reporting.  
* **Transformations analytiques (dbt)** : Modélisation des ventes par client, produit, et localisation.  
* **Orchestration (Airflow)** : Automatisation des workflows ETL/ELT.  
* **Visualisation (Superset)** : Tableaux de bord interactifs sur les ventes et performances.

---

## 🛠️ 3. Architecture Technique

L'architecture de RetailFlow repose sur une approche **modulaire et évolutive**, comme illustrée ci-dessous :

![Architecture Diagramme](./static/projet-retailflow-talend.png)

---

## 📌 4. Détails des Composants :

* **MySQL (Base de données transactionnelle)**  
  * Stocke les transactions clients, produits et commandes.

* **Fichier CSV (Localisation des magasins)**  
  * Fichier externe stocké localement.

* **Talend (Ingestion de données)**  
  * Collecte les données depuis MySQL et le fichier CSV.  
  * Envoie les données vers MinIO (Data Lake) et PostgreSQL (Data Warehouse).

* **MinIO (Stockage Objet)**  
  * Stockage de fichiers bruts et formatés pour les traitements futurs.

* **PostgreSQL (Data Warehouse)**  
  * Stocke les données modélisées pour les requêtes analytiques.

* **dbt (Transformation)**  
  * Transforme les données en modèles analytiques (vue agrégée des ventes, clients, etc.).

* **Airflow (Orchestration)**  
  * Automatisation de la collecte (Talend), transformation (dbt) et mise à jour des tableaux de bord.

* **Superset (Visualisation)**  
  * Crée des tableaux de bord interactifs pour explorer les ventes, les clients et les magasins.

---

## 🎓 5. Étapes Clés du Pipeline de Données

* **Ingestion avec Talend :**  
  * Synchronisation régulière des données depuis MySQL et le fichier CSV vers PostgreSQL et MinIO.

* **Stockage :**  
  * Les données sont centralisées dans PostgreSQL pour des analyses structurées.  
  * Les fichiers bruts sont stockés dans MinIO.

* **Transformation avec dbt :**  
  * Agrégation des ventes par client, produit et localisation.  
  * Nettoyage et structuration des données.

* **Orchestration avec Airflow :**  
  * Automatisation de la collecte (Talend), transformation (dbt) et mise à jour des tableaux de bord.

* **Visualisation avec Superset :**  
  * Création de tableaux de bord pour analyser :  
    * Les produits les plus vendus.  
    * Les clients les plus rentables.  
    * La performance des magasins par région.

---

## 📝 6. Configuration du Projet

### 🛠️ Prérequis :
* Docker & Docker Compose installés localement.  
* Python 3.x pour les scripts de génération de données.

### 📥 Installation :
```bash
git clone https://github.com/username/retail-flow-project.git
cd retail-flow-project

# Étape 1
cd step1-mysql
docker-compose up -d
python data_generator.py

# Étape 2
cd step2-data-engineering
docker-compose up -d
```


## 📊 7. Tableaux de Bord Attendues :
* Performance des ventes par région.
* Top 10 des clients avec les plus gros achats.
* Produits les plus vendus.

## 📊 8. Ressources Utiles :
* Talend Documentation: https://www.talend.com
* dbt Documentation: https://docs.getdbt.com
* Apache Superset: https://superset.apache.org

## 📂 9. Arborescence du Projet :
```plaintext
retail-flow-project/
│
├─ step1-mysql/
│  ├─ docker-compose.yml
│  ├─ init-db.sql
│  ├─ data_generator.py
│
├─ step2-data-engineering/
│  ├─ docker-compose.yml
│  ├─ .env
│  ├─ minio/              
│  ├─ postgres/           
│  ├─ dbt/                
│  ├─ airflow/            
│  ├─ superset/                
│  ├─ scripts/           
│  ├─ logs/               
│
├─ talend/
│  ├─ jobs/ 
│  ├─ configs/
│
├─ data/
│  ├─ store_locations.csv
│
└─ README.md
```
## Licence:
<p>Ce projet est sous licence MIT. Consultez le fichier LICENSE.md pour plus de détails.</p>

## Contact:
<p>Auteur : julien Awon'ga </p>
<p>Email : julienawon@gmail.com</p>
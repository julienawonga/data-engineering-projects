# ETL Pipeline on Google Cloud: Dataflow and BigQuery

## Project Overview

This project demonstrates an ETL (Extract, Transform, Load) pipeline built on **Google Cloud**. It processes large datasets by ingesting CSV files from **Cloud Storage**, transforming the data using **Dataflow** with Apache Beam (Python), and loading the transformed data into **BigQuery** for analysis.

## Objectives

- **Ingest** CSV data from Google Cloud Storage.
- **Transform** data (filter headers, format dates, etc.) using Apache Beam.
- **Load** the processed data into BigQuery.
- **Enrich** data by joining multiple datasets in BigQuery and creating denormalized tables.

## Technology Stack

- **Google Cloud Platform**:
  - **Cloud Storage**: Store raw data files.
  - **Dataflow**: For ETL processing using Apache Beam.
  - **BigQuery**: Store and analyze processed data.
- **Python**: Used to build Dataflow pipelines.
- **Apache Beam**: Framework for batch and stream processing.

## Features

1. **Data Ingestion**:
   - Read CSV files from Cloud Storage.
   - Remove headers and convert lines into dictionary objects.
   
   *(Place diagram: CSV ingestion to Cloud Storage → Dataflow → BigQuery)*

2. **Data Transformation**:
   - Format dates and clean data for BigQuery compatibility.
   
   *(Place diagram: Dataflow pipeline structure and data transformation logic)*

3. **Data Loading**:
   - Load the cleaned data into BigQuery for querying and analysis.
   
   *(Place diagram: Dataflow to BigQuery flowchart)*

4. **Data Enrichment**:
   - Join multiple datasets in BigQuery and create a denormalized data mart.

   *(Place diagram: BigQuery table joins and resulting Data Mart)*

## Project Structure

- `data_ingestion.py`: Ingest CSV data from Cloud Storage and load it into BigQuery.
- `data_transformation.py`: Perform transformations like date formatting.
- `data_enrichment.py`: Join datasets to create an enriched dataset.
- `data_lake_to_mart.py`: Move data from a data lake to a data mart using joins.

## Setup Instructions

### Prerequisites

- A Google Cloud account with access to BigQuery, Dataflow, and Cloud Storage.
- Docker installed for running the Python environment.

### Steps

1. **Clone the repository**:
   ```bash
        gcloud storage cp -r gs://spls/gsp290/dataflow-python-examples .
   ```
2. **Create a Cloud Storage bucket:**:
    ```bash
        gcloud storage buckets create gs://$PROJECT --default-storage-class=regional --location=<REGION>
    ```
3. **Run the Dataflow pipeline:**
    1. Launch Docker container with Python 3.8:
        ```bash
            docker run -it -e PROJECT=$PROJECT -v $(pwd)/dataflow-python-examples:/dataflow python:3.8 /bin/bash
        ```
    2. Install Apache Beam:
        ```bash
            pip install apache-beam[gcp]==2.59.0
        ```
    3. Run the ingestion pipeline:
        ```bash
            python dataflow_python_examples/data_ingestion.py \
                --project=$PROJECT --region=<REGION> \
                --runner=DataflowRunner \
                --machine_type=e2-standard-2 \
                --staging_location=gs://$PROJECT/test \
                --temp_location gs://$PROJECT/test \
                --input gs://$PROJECT/data_files/head_usa_names.csv \
                --save_main_session
        ```
4. **Expected Results:**
    <p >After successfully running the pipeline, you will have:</p>

    - BigQuery tables populated with ingested and transformed data.
    - Enriched datasets after joining multiple data sources.

5. **Future Enhancements :**
    - Add data validation before loading into BigQuery.
    - Automate pipeline execution using Google Cloud Functions.
    - Visualize data using Google Data Studio.
    
## Acknowledgment

This project is originally part of the Google Cloud Skills Boost platform, specifically from the lab "ETL Processing on Google Cloud Using Dataflow and BigQuery (Python)." I have adapted and re-implemented it to showcase my skills and understanding of cloud-based ETL pipelines. All the original concepts, materials, and instructions are provided by Google Cloud Skills Boost, and this adaptation is for educational and portfolio purposes.
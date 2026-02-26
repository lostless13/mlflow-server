FROM python:3.10-slim

# Install MLflow and the two required drivers
# 1. psycopg2-binary: To talk to your PostgreSQL database
# 2. google-cloud-storage: To talk to your GCS bucket
RUN pip install mlflow \
                psycopg2-binary \
                google-cloud-storage

# Set the container port (Cloud Run's default)
EXPOSE 8080

# This is the command that will run
CMD ["mlflow", "server", \
     "--host", "0.0.0.0", \
     "--port", "8080", \
     "--no-serve-artifacts"
     ]

# gcloud builds submit --tag us-central1-docker.pkg.dev/cam-triangle/elysian-docker/mlflow-server
# Flask + PostgreSQL Kubernetes Project

A small practice project where I deployed a Flask application with PostgreSQL using Docker and Kubernetes.

The main goal of this project was to understand how an application, database, containers, and Kubernetes resources work together.

## Project Structure

```text
k8s-usr-app/
├── Dockerfile
├── app.py
├── requirements.txt
├── static/
├── templates/
└── k8s/
    ├── flask-deployment.yml
    ├── flask-service.yml
    ├── flask-config.yml
    ├── flask-secret.yml
    ├── postgres-deployment.yml
    ├── postgres-service.yml
    ├── postgres-config.yml
    ├── postgres-secret.yml
    └── postgres-pvc.yml
```

## Technologies Used

- Python / Flask
- PostgreSQL
- Docker
- Kubernetes
- Minikube
- ConfigMap
- Secrets
- PersistentVolumeClaim

## What I Practiced

- Created a Docker image using a multi-stage Dockerfile
- Ran Flask and PostgreSQL as separate containers
- Created Kubernetes Deployments for Flask and PostgreSQL
- Used a PostgreSQL Service for internal communication
- Used ConfigMaps for application configuration
- Used Secrets for database credentials
- Used a PersistentVolumeClaim for PostgreSQL data
- Connected Flask to PostgreSQL using Kubernetes Service DNS
- Tested the application using a ClusterIP Service
- Exposed the Flask application externally using NodePort
- Ran multiple Flask replicas

## Kubernetes Architecture

```text
                 Browser
                    |
                 NodePort
                    |
             flask-service
                    |
          ---------------------
          |        |          |
       Flask Pod Flask Pod Flask Pod
          |        |          |
          ------ PostgreSQL ------
                    |
            postgres-service
                    |
             PostgreSQL Pod
                    |
              PostgreSQL PVC
```

## Running the Project

This project was tested locally using Minikube.

The Docker image needs to be available inside Minikube before creating the Flask Pods.

The Kubernetes resources are stored inside the `k8s` directory.

## Secrets

Secret files are **not committed to this repository**.

Before running the project, create your own:

- PostgreSQL Secret
- Flask Secret

using the example files provided in the repository.

## What I Learned

This project helped me understand how Docker and Kubernetes connect together in a real application setup, especially Services, Pods, Deployments, ConfigMaps, Secrets, and persistent storage.

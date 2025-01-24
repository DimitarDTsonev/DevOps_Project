# DevOps Project: Flask App with CI/CD and AWS Deployment

## Overview
This project is a simple **Flask web application** that serves two endpoints:
- `/` - Returns "Hello World"
- `/hostname` - Returns the hostname of the container running the app.

The application is **containerized** using Docker, deployed on **AWS EC2**, and automated via a CI/CD pipeline using **GitHub Actions**, **Terraform**, and **Ansible**.

---

## Features
- REST API with Flask
- Dockerized for easy deployment
- CI/CD pipeline for continuous integration and deployment
- AWS infrastructure provisioning with Terraform
- Automated deployment using Ansible

---

## Setup Instructions

### Prerequisites
- Docker installed locally
- An AWS account with permissions to create EC2 instances
- Terraform and Ansible installed

---

### Step 1: Clone the Repository

Clone the repository to your local machine:
```bash
git clone https://github.com/DimitarDTsonev/DevOps_Project.git
cd ./DevOps_Project
```

### Step 2: Build and Run the App Locally
  Build the Docker image:
    ```bash
        docker build -t flask-app .
    ```
  Run the countainer
      
      docker run -d -p 80:80 flask-app

Access the app:
Local: http://localhost
Deployed (AWS): Use the public IP of the EC2 instance.

### Step 3: CI/CD Pipeline
This project uses GitHub Actions for automation:

Build and Push: Automatically builds and pushes the Docker image to GitHub Container Registry (GHCR).
Terraform Deployment: Provisions AWS infrastructure (EC2 instance and security group).
Ansible Deployment: Configures the EC2 instance to install Docker and deploy the application.
Execute the Deployed App
Click the link below to access the deployed application: Deployed App on AWS

Replace <YOUR-EC2-PUBLIC-IP> with the public IP of your deployed AWS EC2 instance. This IP is output by Terraform during the deployment process.

## Technologies Used
Flask: Web framework for the application
Docker: Containerization
GitHub Actions: CI/CD automation
Terraform: Infrastructure as Code for AWS
Ansible: Deployment automation

## Contributors
  Dimitar Tsonev

## Future Improvements

Add unit tests for the Flask application.
Implement HTTPS for the deployed application.
Deploy using an AWS Elastic Load Balancer (ELB) for scalability.
Use AWS Secrets Manager to securely store sensitive information.

[Deployed App on AWS](http://13.58.145.213)

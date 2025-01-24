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

[Deployed App on AWS](http://13.58.145.213)

# Automated Deployment with Terraform, Ansible, and GitHub Actions

This project automates the deployment of a web application using Terraform, Ansible, and GitHub Actions.

## Prerequisites

- AWS account
- Terraform installed
- Ansible installed

## Usage

1. Clone the repository.
2. Configure AWS credentials.
3. Push changes to the `main` branch to trigger the deployment.

## Directory Structure

- `terraform/`: Contains Terraform configuration files.
- `ansible/`: Contains Ansible playbook and inventory.
- `app/`: Contains the application code and Dockerfile.
- `.github/workflows/`: Contains GitHub Actions workflow.
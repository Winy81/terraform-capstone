# Terraform AWS Capstone

This project provisions a multi-tier AWS infrastructure using Terraform.

## Architecture

```text
Internet
    |
    v
Application Load Balancer
    |
    v
+---------------------+
|  App Server AZ1     |
|  App Server AZ2     |
|  App Server AZ3     |
+---------------------+
    ^
    |
Bastion Host
    ^
    |
Developer Workstation
```

## Components

### Networking

- VPC
- 3 Public Subnets
- 3 Private Subnets
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table

### Security

- Bastion Security Group
- Application Security Group
- Database Security Group
- ALB Security Group

### Compute

- Bastion Host (public)
- 3 Application Servers (private)

### Load Balancing

- Application Load Balancer
- Target Group
- HTTP Listener
- Health Checks

## Terraform Commands

Initialize:

```bash
terraform init
```

Plan:

```bash
terraform plan -var-file=test.tfvars
```

Apply:

```bash
terraform apply -var-file=test.tfvars
```

Destroy:

```bash
terraform destroy -var-file=test.tfvars
```

## Outputs

Show deployed infrastructure:

```bash
terraform output
```

Outputs include:

- VPC ID
- Internet Gateway ID
- NAT Gateway ID
- Route Table IDs
- Bastion Public IP
- App Server Instance IDs
- App Server Private IPs
- ALB DNS Name
- Security Group IDs

## Bastion Access

Connect to bastion:

```bash
ssh -i ~/codecool/adam-ec2-key.pem ec2-user@<bastion-public-ip>
```

Enable SSH agent forwarding:

```bash
ssh-add ~/codecool/adam-ec2-key.pem

ssh -A -i ~/codecool/adam-ec2-key.pem ec2-user@<bastion-public-ip>
```

Connect to private instance:

```bash
ssh ec2-user@<private-ip>
```

## Demo Sinatra Application

The repository contains a simple Sinatra application used by the ALB health check.

Health endpoint:

```text
GET /health
```

Expected response:

```text
OK
```

Root endpoint:

```text
GET /
```

Returns a simple response containing the hostname of the application server.

## Notes

This project is intended for learning and demonstration purposes.

Several outputs are intentionally exposed to make infrastructure components easy to demonstrate during presentations and assessments.

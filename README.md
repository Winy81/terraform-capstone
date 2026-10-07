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





## Application Deployment

The Application Load Balancer health check expects:

```text
GET /health
```

and a successful:

```text
HTTP 200
```

response.

### Application Files

#### app.rb

```ruby
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 80

get '/' do
  hostname = `hostname`.strip

  <<~HTML
    <h1>Terraform Capstone</h1>
    <p>Served by #{hostname}</p>
  HTML
end

get '/health' do
  status 200
  'OK'
end
```

#### Gemfile

```ruby
source 'https://rubygems.org'

gem 'sinatra'
```

---

## Deploy Process

Connect to the Bastion Host:

```bash
ssh-add ~/codecool/adam-ec2-key.pem

ssh -A -i ~/codecool/adam-ec2-key.pem ec2-user@<bastion-public-ip>
```

Connect to an application server:

```bash
ssh ec2-user@<private-ip>
```

Install Ruby:

```bash
sudo dnf install -y ruby
```

Create:

```text
app.rb
Gemfile
```

Optional Bundler approach:

```bash
gem install bundler
bundle install
```

For this project the following worked reliably:

```bash
sudo gem install sinatra

sudo dnf install -y ruby3.2-devel

sudo gem install rackup puma
```

Verify Sinatra installation:

```bash
ruby -e "require 'sinatra'; puts Sinatra::VERSION"
```

Expected output:

```text
4.2.1
```

---

## Run Application

Starting the application directly:

```bash
sudo ruby app.rb
```

This works, but keeps the terminal session occupied.

Run in the background:

```bash
nohup sudo ruby app.rb > app.log 2>&1 &
```

Verify the process:

```bash
ps -ef | grep ruby
```

View logs:

```bash
tail -f app.log
```

Example log output:

```text
* Listening on http://0.0.0.0:80
GET /health HTTP/1.1" 200
```

---

## Validation

Verify locally on the EC2 instance:

```bash
curl localhost/health
```

Expected response:

```text
OK
```

Requests appear in:

```text
app.log
```

Once deployed to all three application servers, the ALB Target Group health checks should transition to:

```text
Healthy
```

for all registered targets.

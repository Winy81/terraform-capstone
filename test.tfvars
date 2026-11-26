region   = "eu-central-1"
vpc_cidr = "10.0.0.0/16"
public_subnets = {
  az1 = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "eu-central-1a"
  }

  az2 = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "eu-central-1b"
  }

  az3 = {
    cidr_block        = "10.0.3.0/24"
    availability_zone = "eu-central-1c"
  }
}

private_subnets = {
  az1 = {
    cidr_block        = "10.0.11.0/24"
    availability_zone = "eu-central-1a"
  }

  az2 = {
    cidr_block        = "10.0.12.0/24"
    availability_zone = "eu-central-1b"
  }

  az3 = {
    cidr_block        = "10.0.13.0/24"
    availability_zone = "eu-central-1c"
  }
}

nat_gateway_subnet_key = "az1"
default_route_cidr = "0.0.0.0/0"
instance_type = "t2.micro"
# Your public IP in CIDR notation.
# Example:
# admin_ip = "185.192.157.177/32"
#
# For lab/testing only:
# admin_ip = "0.0.0.0/0"
admin_ip = "185.192.157.177/32"

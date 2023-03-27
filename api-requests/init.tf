# Initialize Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region_deployment
  access_key = var.access_key
  secret_key = var.secret_key
}

# Declare availability zones data source
data "aws_availability_zones" "availabilty_zones" {
  state = "available"
}

# Declare environmental variables
variable "access_key" {}
variable "secret_key" {}
variable "region_deployment" {}

# Output variables
output "access_key" { value = var.access_key }
output "secret_key" { value = var.secret_key }
output "region_deployment" { value = var.region_deployment }
output "availabilty_zones" { value = data.aws_availability_zones.availabilty_zones.names }
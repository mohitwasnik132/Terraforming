terraform {
  required_version = ">= 0.12.8"
}

provider "aws" {
  region = var.region
}
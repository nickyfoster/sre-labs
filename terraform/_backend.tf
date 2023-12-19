terraform {
  required_version = ">= 1.1.9"

  backend "s3" {
    bucket         = "tf-states"
    dynamodb_table = "tf-state"
    key            = "lab-infra/terraform.tfstate"
    encrypt        = true
    region         = "us-east-1"
    profile        = "main"
  }
}

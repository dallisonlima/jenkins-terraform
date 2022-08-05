terraform {
  backend "s3" {
    bucket         = "dallison-state-terraform"
    region         = "us-east-1"
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA5EYHGFX27C7VHPHP"
  secret_key = "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"
}

resource "aws_instance" "voda_ec2" {
  ami           = "ami-0a5ac53f63249fba0"
  instance_type = "t2.micro"
}

resource "aws_vpc" "vodaxxx" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "vodas3" {
  bucket = "my-voda-s3-bucket"
}

resource "aws_vpc_endpoint" "voda_s3" {
  vpc_id       = aws_vpc.vodaxxx.id
  service_name = "com.amazonaws.ap-south-1.s3"
}

provider "aws" {
  region = "us-east-2"
  access_key = "AKIAIXT2E6ZTFNBWZIXQ"
  secret_key = "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"
}

resource "aws_instance" "test" {
  ami = "ami-04328208f4f0cf1fe"
  instance_type = "t2.micro"
}

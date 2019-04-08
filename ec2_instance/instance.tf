provider "aws"{
  region = "us-east-2"
}

resource "aws_instance" "testing" {
  ami = "ami-0653e888ec96eab9b"
  instance_type = "t2.micro"
  key_name = "vprofile"
  #security_groups = ["appsdynamics"]
  subnet_id = "subnet-771ed13b"
}

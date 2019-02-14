
resource "aws_instance" "test" {
  ami = "ami-04328208f4f0cf1fe"
  instance_type = "t2.micro"
}

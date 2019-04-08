resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "test-vpc"
   }


}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.test-vpc.id}"
  availability_zone = "us-east-2a"
  cidr_block = "10.0.1.0/24"
  tags {
    Name = "test-vpc-public"
 }


}

resource "aws_internet_gateway" "test-vpc-IG" {
  #name = "IG"
  vpc_id = "${aws_vpc.test-vpc.id}" 
  tags {
    Name = "test-vpc-IG"

   }


}

resource "aws_route_table" "test-vpc-rt" {
  vpc_id = "${aws_vpc.test-vpc.id}"

route {
       cidr_block = "0.0.0.0/0"
       gateway_id = "${aws_internet_gateway.test-vpc-IG.id}"
  }



}

resource "aws_route_table_association" "test-vpc-rt" {
  subnet_id = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.test-vpc-rt.id}"


}
resource "aws_instance" "testing" {
  ami = "ami-0653e888ec96eab9b"
  instance_type = "t2.micro"
  key_name = "vprofile"
  #security_groups = ["appsdynamics"]
  subnet_id = "${aws_subnet.public.id}"
}
  

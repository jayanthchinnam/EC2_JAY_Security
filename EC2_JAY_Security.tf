provider "aws" {
  region = "ap-south-1"
}



resource "aws_security_group" "allow_jay" {
  name        = "allow_jay"
  description = "Allow jay traffic"
  

  ingress  =  [
  {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
]
  egress  =  [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]
  tags = {
    Name = "allow_jay"
  }
}
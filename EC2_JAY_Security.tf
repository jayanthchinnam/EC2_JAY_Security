provider "aws" {
  region = "ap-south-1"
}



#Ec2instance

resource "ec2_instance" "allow_sample" {
  ami                    = "ami-08df646e18b182346"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group_ids.allow_sample.id, "sg-093281f140f51b9ca"]

  tags = {
    name  = "allow_sample"
  }
}

#security group creation

resource "aws_security_group" "allow_sample" {
  name        = "allow_sample"
  description = "allow_sample traffic"
  

  ingress  =  [
  {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    Prefix_list_id   = []
    security_groups  = []
    self             = false
  }
]
  egress  =  [
  {
    description      = "egress"  
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]
  tags = {
    Name = "allow_sample"
  }
}

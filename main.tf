#creating a vpc
resource "aws_vpc" "pooja-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
    enable_dns_support = "true"  #gives you an internal domain name
    enable_dns_hostnames = "true"  #gives you an internal host name
   # enable_classiclink = "false" 

  tags = {
    Name = "pooja-vpc"
    Owner = "pooja@cloudeq.com"
    Purpose ="training"
  }
}
#first subnet
resource "aws_subnet" "pooja-subnet1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.pooja-vpc.id
  map_public_ip_on_launch = true # This makes the subnet public

  tags = {
    Name = "pooja-subnet1"
    Owner = "pooja@cloudeq.com"
    Purpose ="training"
  }
}

# creating instance
resource "aws_instance" "pooja-inst1" {
  count = var.var-inst1
   ami= "ami-0f1a5f5ada0e7da53"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.pooja-subnet1.id
   security_groups = ["${aws_security_group.pooja-security.id}"]
tags ={
    Name ="pooja-inst1-${count.index}"
    Owner ="pooja@cloudeq.com"
    Purpose = "training"
}
volume_tags = {
    Name ="pooja-vol"
    Owner ="pooja@cloudeq.com"
    Purpose = "training"
  "availability_zone" = "us-west-2"
  size= 40
}
}

#second subnet
resource "aws_subnet" "pooja-subnet2" {
 
  cidr_block              = "10.0.0.0/24"
  vpc_id                  = aws_vpc.pooja-vpc.id
  map_public_ip_on_launch = true # This makes the subnet public

  tags = {
    Name = "pooja-subnet2"
    Owner = "pooja@cloudeq.com"
    Purpose ="training"
  }
}

# creating instance
resource "aws_instance" "pooja-inst2" {
  count = var.var-inst2
   ami= "ami-0f1a5f5ada0e7da53"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.pooja-subnet2.id
   security_groups = ["${aws_security_group.pooja-security.id}"]
tags ={
    Name ="pooja-inst2-${count.index}"
    Owner ="pooja@cloudeq.com"
    Purpose = "training"
}
volume_tags = {
    Name ="pooja-vol"
    Owner ="pooja@cloudeq.com"
    Purpose = "training"
  "availability_zone" = "us-west-2"
  size= 40
}
}



  


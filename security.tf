
# security group
resource "aws_security_group" "pooja-security" {
  name        = "security-g"
  description = "security group"
  vpc_id = "${aws_vpc.pooja-vpc.id}"
   
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   # any where
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
// Terraform removes the default rule
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"     # all traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "pooja-security"
    Owner ="pooja@cloudeq.com"
    Purpose = "training"
  }
}

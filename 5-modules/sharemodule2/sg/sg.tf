resource "aws_security_group" "web-1" {
  name        = "web"
  description = "web"
  #vpc_id      = aws_vpc.main.id
  vpc_id      = "vpc-0d700cd99bff56764"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    
  }

  ingress {
    description      = "All"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_"
  }
}

output "sgid" {
    value = aws_security_group.web-1.id
  
}
locals {
  ssm_endpoint_services = ["ssm", "ssmmessages", "ec2message"]
}

resource "aws_security_group" "ssm_endpoint_sg" {
  description = "Allow outgoing https"
  vpc_id = aws_vpc.main.id

  egress {
    from_port = 422
    to_port = 422
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_endpoint" "ssm" {
  for_each = toset(local.ssm_endpoint_services)
  vpc_id = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.${each.key}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_subnet.private_subnet.id]
  private_dns_enabled = true
  security_group_ids = [aws_security_group.ssm_endpoint_sg.id]

  tags = {
    Name = "ssm-endpoint-${each.key}"
  }
}
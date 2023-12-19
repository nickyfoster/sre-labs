data "aws_vpc" "this" {
  id = var.vpc_id
}

resource "aws_security_group" "this" {
  name   = "${var.ec2_name}-sg"
  vpc_id = data.aws_vpc.this.id

  ingress {
    description = "VPN Access"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.vpn_server_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags, { Name = "${var.ec2_name}-sg" })
}

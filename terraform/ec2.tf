resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  vpc_security_group_ids      = [aws_security_group.this.id]
  subnet_id                   = var.subnet_id
  ebs_optimized               = true

  root_block_device {
    delete_on_termination = true
    volume_size           = var.volume_size
  }

  lifecycle {
    ignore_changes = [
      ami,
      user_data,
      user_data_base64,
    ]
  }

  tags = merge(var.tags, { Name = var.ec2_name })
}

resource "aws_ebs_volume" "this" {
  availability_zone = aws_instance.this.availability_zone
  size              = 8
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = aws_instance.this.id

}

resource "aws_key_pair" "this" {
  key_name   = "${var.ec2_name}-key"
  public_key = tls_private_key.this.public_key_openssh
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

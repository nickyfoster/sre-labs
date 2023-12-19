output "private_key" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}

output "ec2_public_ip" {
  value = aws_instance.this.public_ip
}

output "instance_ip" {
  value       = aws_instance.nginx_server.public_ip
  description = "IP pública del servidor EC2 con Nginx"
}

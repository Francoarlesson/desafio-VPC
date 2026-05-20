output "ip_publico_da_maquina" {
  description = "O IP publico da EC2 gerado pela AWS"
  value       = aws_instance.web_server.public_ip
}
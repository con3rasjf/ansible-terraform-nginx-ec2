variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
}

variable "public_key_path" {
  description = "Ruta local al archivo .pub"
}

variable "private_key_path" {
  description = "Ruta local al archivo .pem"
}

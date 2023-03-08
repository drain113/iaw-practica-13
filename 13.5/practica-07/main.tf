
provider "aws" {
  region = var.region
}


# Creación SG
resource "aws_security_group" "frontend_sg" {
  name        = var.sg_name_frontend
  description = var.sg_description_frontend
}

resource "aws_security_group" "backend_sg" {
  name        = var.sg_name_backend
  description = var.sg_description_backend
}


# Reglas entrada SG
resource "aws_security_group_rule" "ingress" {
  security_group_id = aws_security_group.frontend_sg.id
  type              = "ingress"

  count       = length(var.allowed_ingress_ports_frontend)
  from_port   = var.allowed_ingress_ports_frontend[count.index]
  to_port     = var.allowed_ingress_ports_frontend[count.index]
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress2" {
  security_group_id = aws_security_group.backend_sg.id
  type              = "ingress"

  count       = length(var.allowed_ingress_ports_backend)
  from_port   = var.allowed_ingress_ports_backend[count.index]
  to_port     = var.allowed_ingress_ports_backend[count.index]
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}


# Creación EC2
resource "aws_instance" "Frontend" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.frontend_sg.name]

  tags = {
    Name = var.instance_name_frontend
  }
}

resource "aws_instance" "Backend" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.backend_sg.name]

  tags = {
    Name = var.instance_name_backend
  }
}

# Creación IP Elástica
resource "aws_eip" "ip_elastica" {
  instance = aws_instance.FRONTEND_01.id
}
# -----------------------------------------
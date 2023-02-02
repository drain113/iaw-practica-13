# Configuramos el proveedor de AWS
provider "aws" {
  region = "us-east-1"
}

# Creamos un grupo de seguridad Backend
resource "aws_security_group" "sg_backend" {
  name        = "sg_ejemplo_03"
  description = "Grupo de seguridad para Backend"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Creamos un grupo de seguridad Frontend
resource "aws_security_group" "sg_frontend" {
  name        = "sg_ejemplo_03"
  description = "Grupo de seguridad para Backend"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creamos una instancia EC2 para el Backend
resource "aws_instance" "ec_backend" {
  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.small"
  key_name               = "vockey"
  security_groups = [aws_security_group.sg_backend.name]

  tags = {
    Name = "ec_backend"
  }
}

# Creamos una instancia EC2 para el Frontend
resource "aws_instance" "ec_frontend" {
  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.small"
  key_name               = "vockey"
  security_groups = [aws_security_group.sg_frontend.name]

  tags = {
    Name = "ec_frontend"
  }
}

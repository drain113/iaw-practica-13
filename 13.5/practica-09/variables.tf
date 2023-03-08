
variable "region" {
  description = "Región AWS"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Vockey"
  type        = string
  default     = "vockey"
}

variable "instance_type" {
  description = "Tipo instancia"
  type        = string
  default     = "t2.medium"
}

variable "ami_id" {
  description = "AMI"
  type        = string
  default     = "ami-00874d747dde814fa"
}


# Puertos entrada
variable "allowed_ingress_ports_frontend" {
  description = "Puertos de entrada SG Frontend"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "allowed_ingress_ports_backend" {
  description = "Puertos de entrada SG Backend"
  type        = list(number)
  default     = [22, 3306]
}

variable "allowed_ingress_ports_loadbalancer" {
  description = "Puertos de entrada SG LoadBalancer"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "allowed_ingress_ports_nfs" {
  description = "Puertos de entrada SG NFS"
  type        = list(number)
  default     = [22, 2049]
}


# Frontend
variable "sg_name_frontend" {
  description = "Nombre SG Frontend"
  type        = string
  default     = "frontend_sg"
}

variable "sg_description_frontend" {
  description = "Descripcion SG Frontend"
  type        = string
  default     = "Descripcion SG Frontend"
}

variable "instance_name_frontend" {
  description = "Nombre EC2 Frontend"
  type        = string
  default     = "Frontend"
}

# Backend
variable "sg_name_backend" {
  description = "Nombre SG Backend"
  type        = string
  default     = "backend_sg"
}

variable "sg_description_backend" {
  description = "Descripcion SG Backend"
  type        = string
  default     = "Descripcion SG Backend"
}

variable "instance_name_backend" {
  description = "Nombre EC2 Backend"
  type        = string
  default     = "Backend"
}

# Load Balancer
variable "sg_name_loadbalancer" {
  description = "Nombre SG Loadbalancer"
  type        = string
  default     = "loadbalancer_sg"
}

variable "sg_description_loadbalancer" {
  description = "Descripcion SG LoadBalancer"
  type        = string
  default     = "GruDescripcion SG LoadBalancer"
}

variable "instance_name_loadbalancer" {
  description = "Nombre EC2 Loadbalancer"
  type        = string
  default     = "LoadBalancer"
}

# NFS
variable "sg_name_nfs" {
  description = "Nombre SG NFS"
  type        = string
  default     = "nfs_sg"
}

variable "sg_description_nfs" {
  description = "Descripcion SG NFS"
  type        = string
  default     = "Descripcion SG NFS"
}

variable "instance_name_nfs" {
  description = "Nombre de la instancia NFS"
  type        = string
  default     = "NFS"
}







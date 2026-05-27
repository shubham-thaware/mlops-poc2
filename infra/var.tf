variable "infra_env" {
  description = "Provide AWS deployment environment"
  type        = string
}

variable "app_name" {
  description = "Provide the AWS infrastructure deployment name to be used as the resource name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Provide the VPC CIDR block to isolate the environment"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "Provide the CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "Provide the CIDR block for public subnet 2"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "Provide the CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "Provide the CIDR block for private subnet 2"
  type        = string
}

variable "eks_version" {
  description = "Provide the EKS cluster version"
  type        = string
}

# variable "ami_id" {
#   description = "Provide the AMI ID for the EC2 instance"
#   type = string
# }

# variable "key_pair_name" {
#   description = "Provide the EC2 SSH key pair name"
#   type = string
# }

# variable "bastion_instance_type" {
#   description = "Provide the instance type for the bastion EC2 instance"
#   type = string
# }

# variable "db_instance_type" {
#   description = "Provide the instance type for the database EC2 instance"
#   type = string
# }

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "eks_endpoint_public_access" {
  type    = bool
  default = false
}

variable "default_tags" {
  type = map(string)
  default = {
    Environment = "poc2"
    Owner       = "devops"
    Project     = "eks-mlops-infra"
  }
}

variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "node_volume_size" {
  type    = number
  default = 20
}

variable "node_desired" {
  type    = number
  default = 2
}

variable "node_min" {
  type    = number
  default = 1
}

variable "node_max" {
  type    = number
  default = 4
}
variable "create_spot_node_group" {
  type    = bool
  default = false
}

variable "spot_instance_types" {
  type    = list(string)
  default = ["t3.small"]
}
variable "spot_desired_size" {
  type    = number
  default = 0
}

variable "spot_min_size" {
  type    = number
  default = 0
}

variable "spot_max_size" {
  type    = number
  default = 0
}

variable "node_labels" {
  type = map(string)
  default = {
    role = "worker"
    env  = "poc2"
  }
}

variable "control_plane_log_types" {
  type    = list(string)
  default = ["api", "audit", "authenticator"]
}

variable "enable_kms" {
  type    = bool
  default = false
}

variable "eks_endpoint_private_access" {
  description = "Enable private access to EKS API server"
  type        = bool
  default     = false
}
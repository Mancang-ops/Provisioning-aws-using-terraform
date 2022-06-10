variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "VPC CIDR BLOCK"
    type = string
}

variable "public-subnet-1-cidr" {
    default = "10.0.0.0/24"
    description = "public subnet 1 CIDR block"
    type = string
}

variable "public-subnet-2-cidr" {
    default = "10.0.1.0/24"
    description = "public subnet 2 CIDR block"
    type = string
}

variable "private-subnet-1-cidr" {
    default = "10.0.2.0/24"
    description = "private subnet 1 CIDR block"
    type = string
}

variable "private-subnet-2-cidr" {
    default = "10.0.3.0/24"
    description = "private subnet 2 CIDR block"
    type = string
}

variable "private-subnet-3-cidr" {
    default = "10.0.4.0/24"
    description = "private subnet 3 CIDR block"
    type = string
}

variable "private-subnet-4-cidr" {
    default = "10.0.5.0/24"
    description = "private subnet 4 CIDR block"
    type = string
}

variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-southeast-1 = "ami-059fcf742de12af88"
    ap-southeast-2 = "ami-04af8b67163f654af"
    ap-southeast-3 = "ami-0cbcf2d96a804a95f"
  }
}
variable "RDS_PASSWORD" {
    
}

variable "vpc_cidr" {
  default = "15.0.0.0/16"
}

variable "pri_subnet" {
  default = ["15.0.1.0/24", "15.0.2.0/24", "15.0.3.0/24", "15.0.4.0/24", "15.0.5.0/24", "15.0.6.0/24"]
}

variable "pub_subnet" {
  default = ["15.0.101.0/24", "15.0.102.0/24", "15.0.103.0/24"]
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-jay"
  cidr = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.pri_subnet
  public_subnets  = var.pub_subnet

  enable_dns_support   = true
  enable_dns_hostnames = true

  enable_nat_gateway = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  tags = {
    Name        = "jay sheth"
    Environment = "testing"
  }
}

# output "id_vpc" {
#   value = vpc.vpc_id
# }
# output "pri_subnet_id" {
#   value = vpc.private_subnets
# }
# output "pub_subnet_id" {
#   value = vpc.public_subnets
# }
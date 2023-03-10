module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-jay"
  cidr = "15.0.0.0/16"
  
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["15.0.1.0/24", "15.0.2.0/24", "15.0.3.0/24", "15.0.4.0/24", "15.0.5.0/24", "15.0.6.0/24"]
  public_subnets  = ["15.0.101.0/24", "15.0.102.0/24", "15.0.103.0/24"]
# dns support
# dns host names
  enable_nat_gateway = false

  

  tags = {
    Name = "jay sheth"
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
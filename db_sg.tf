module "db_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jay-db-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  # ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 20
      to_port     = 20
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
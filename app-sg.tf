module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jay-app-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  # ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "https"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "https"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_cidr_blocks = ["0.0.0.0/0"]
  # egress_with_cidr_blocks = [ {
  #   from_port = 0
  #   to_port = 65535
  #   protocol = "-1"
  #   description = "all protocol"
  #   cidr_blocks = "0.0.0.0/0"
  # } ]
}

# create 3rd sg and rename websg to alb sg

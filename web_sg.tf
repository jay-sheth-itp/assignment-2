module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jay-web-sg"
  description = "SG for web tier"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
  }]

  egress_with_cidr_blocks = [{
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"

  }]
  tags = {
    "Name" = "jay-web-sg"
  }

}

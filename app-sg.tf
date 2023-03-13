module "app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jay-app-sg"
  description = "SG for app tier"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [{
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"

  }]


  # ingress_with_source_security_group_id = [{
  #   from_port                = 80
  #   to_port                  = 80
  #   protocol                 = "tcp"
  #   source_security_group_id = module.web_sg.security_group_id
  #   }, {
  #   from_port                = 443
  #   to_port                  = 443
  #   protocol                 = "tcp"
  #   source_security_group_id = module.web_sg.security_group_id
  # }]
  egress_with_cidr_blocks = [{
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]

  tags = {
    "Name" = "jay-app-sg"
  }
}


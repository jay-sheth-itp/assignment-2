module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "alb-jay"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [module.web_sg.security_group_id]

#   access_logs = {
#     bucket = "my-alb-logs"
#   }

  target_groups = [
    {
      name_prefix      = "web-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = aws_instance.web_ec2_1.id
          port = 80
        }
      }
    }
  ]


#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      # target_group_index = 0
    }
  ]


  tags = {
    Environment = "Testing"
    Name = "jay sheth"
  }
}

# output "ec2ids" {
#   value = ""
# }

  # http_tcp_listener_rules = [
  #   {   
  #   actions = [{
  #     type = "forward"
  #     protocol = "HTTP"
  #     target_group_arn = module.asg.target_group_arn
  #   }]
  #   }
  # ]
module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "jay-asg"

  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  target_group_arns         = module.alb.target_group_arns
  vpc_zone_identifier       = module.vpc.private_subnets


  # Launch template
  launch_template_name        = "jay-asg"
  launch_template_description = "launch temlate for asign2 jay"
  update_default_version      = true

  image_id          = data.aws_ami.jay-ec2.id
  instance_type     = "t2.micro"
  ebs_optimized     = false
  enable_monitoring = true
  user_data         = base64encode(templatefile("ud.sh", { endpoint = local.endpoint }))
  security_groups   = [module.app_sg.security_group_id]



  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]
  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }
  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        Name  = "jay sheth"
        Owner = "jay.sheth@intuitive.cloud"
      }
    },
    {
      resource_type = "volume"
      tags = {
        Name  = "jay sheth"
        Owner = "jay.sheth@intuitive.cloud"
      }
    },
  ]

  tags = {
    Environment = "dev"
    Name        = "jay sheth"
    Owner       = "jay.sheth@intuitive.cloud"
  }
}
locals {
  endpoint = module.db.db_instance_endpoint
}

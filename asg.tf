module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "example-asg"

  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "ELB"
  vpc_zone_identifier       = module.vpc.public_subnets


  # Launch template
  launch_template_name        = "jay-asg"
  launch_template_description = "launch temlate for asign2 jay"
  update_default_version      = true

  image_id          = data.aws_ami.jay-ec2.id
  instance_type     = "t2.micro"
  ebs_optimized     = true
  enable_monitoring = false

  # IAM role & instance profile
  

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

  # capacity_reservation_specification = {
  #   capacity_reservation_preference = "open"
  # }

  # cpu_options = {
  #   core_count       = 1
  #   threads_per_core = 1
  # }

  # credit_specification = {
  #   cpu_credits = "standard"
  # }

  # instance_market_options = {
  #   market_type = "spot"
  #   spot_options = {
  #     block_duration_minutes = 60
  #   }
  # }

  # metadata_options = {
  #   http_endpoint               = "enabled"
  #   http_tokens                 = "required"
  #   http_put_response_hop_limit = 32
  # }

  # network_interfaces = [
  #   {
  #     delete_on_termination = true
  #     description           = "eth0"
  #     device_index          = 0
  #     security_groups       = ["sg-12345678"]
  #   },
  #   {
  #     delete_on_termination = true
  #     description           = "eth1"
  #     device_index          = 1
  #     security_groups       = ["sg-12345678"]
  #   }
  # ]

  # placement = {
  #   availability_zone = "us-west-1b"
  # }

  # tag_specifications = [
  #   {
  #     resource_type = "instance"
  #     tags          = { WhatAmI = "Instance" }
  #   },
  #   {
  #     resource_type = "volume"
  #     tags          = { WhatAmI = "Volume" }
  #   },
  #   {
  #     resource_type = "spot-instances-request"
  #     tags          = { WhatAmI = "SpotInstanceRequest" }
  #   }
  # ]

  tags = {
    Environment = "dev"
    Name     = "jay sheth"
  }
}
# output "ec2ids" {
#    value = module.asg.
# }
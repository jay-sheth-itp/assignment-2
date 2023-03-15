resource "aws_route53_record" "alb_record" {
  zone_id = "Z09694789KLKEHOHJN0T"
  name = "jay-sheth-alb"
  type = "CNAME"
  ttl =60
  records = [module.alb.lb_dns_name]
}

resource "aws_route53_record" "rds_record" {
  zone_id = "Z09600291FQN85FFRHCOB"
  name = "jay-sheth-rds"
  type = "CNAME"
  ttl =60
  records = [module.db.db_instance_endpoint]
}


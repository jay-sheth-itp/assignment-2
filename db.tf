module "db" {
    source = "terraform-aws-modules/rds/aws"

    engine = "mysql"
    engine_version = "8.0"

    identifier = "jay-db"
    db_name = "jay-ad"
    username = "jay"
    password = "jay12345"
    
    port = "3306"

    instance_class = "db.t3.micro"

    storage_type = "gp2"
    allocated_storage = 10

    subnet_ids = [module.vpc.private_subnets[3]]
    vpc_security_group_ids = 

}
module "db" {
    source = "terraform-aws-modules/rds/aws"

    engine = "mysql"
    engine_version = "8.0"

    identifier = "jayxdb"
    db_name = "jayxad"
    username = "jay"
    password = "jay12345"
    create_random_password = false

    port = "3306"
    major_engine_version = "8.0"
    family = "mysql8.0"

    instance_class = "db.t3.micro"

    storage_type = "gp2"
    allocated_storage = 10
    create_db_subnet_group = true
    subnet_ids = module.vpc.public_subnets
    vpc_security_group_ids = [module.app_sg.security_group_id]

    tags = {
        Owner = "jay.sheth@intuitive.cloud"
        env = "dev"
    }
    
}
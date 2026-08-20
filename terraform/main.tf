module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  app_subnet_cidrs = var.app_subnet_cidrs

  db_subnet_cidrs = var.db_subnet_cidrs
}


module "security" {
  source = "./modules/security"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id
}
module "compute" {
  source = "./modules/compute"

  project_name = var.project_name

  app_subnet_ids = module.vpc.app_subnet_ids

  app_security_group_id = module.security.app_security_group_id

  instance_type = "t3.micro"
}
module "alb" {
  source = "./modules/alb"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

  alb_security_group_id = module.security.alb_security_group_id

  app_instance_ids = module.compute.instance_ids
}
module "rds" {
  source = "./modules/rds"

  project_name = var.project_name

  db_subnet_ids = module.vpc.db_subnet_ids

  rds_security_group_id = module.security.rds_security_group_id

  instance_class = "db.t3.micro"

  database_name     = "appdb"
  database_username = "appadmin"

  database_password = var.database_password
}
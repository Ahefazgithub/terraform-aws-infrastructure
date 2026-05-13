module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  public_subnet2_cidr  = "10.0.3.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  private_subnet2_cidr = "10.0.4.0/24"
  aws_region           = var.aws_region
  project_name         = var.project_name
  environment          = var.environment
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"

  project_name   = var.project_name
  environment    = var.environment
  s3_bucket_name = "terraform-state-ahefaz"
}

module "ec2" {
  source = "./modules/ec2"

  project_name              = var.project_name
  environment               = var.environment
  ec2_sg_id                 = module.security_groups.ec2_sg_id
  ec2_instance_profile_name = module.iam.ec2_instance_profile_name
  private_subnet_id         = module.vpc.private_subnet_id
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = [module.vpc.public_subnet_id, module.vpc.public_subnet2_id]
  alb_sg_id         = module.security_groups.alb_sg_id
  asg_name          = module.ec2.asg_name
}

module "rds" {
  source = "./modules/rds"

  project_name       = var.project_name
  environment        = var.environment
  private_subnet_id  = module.vpc.private_subnet_id
  private_subnet2_id = module.vpc.private_subnet2_id
  rds_sg_id          = module.security_groups.rds_sg_id
  db_name            = "appdb"
  db_username        = "dbadmin"
  db_password        = "StrongPass123!"
}

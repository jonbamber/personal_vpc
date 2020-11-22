provider "aws" {
  version = "~> 2.43"
  region  = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  name                  = local.vpc_name

  cidr                  = var.vpc_cidr_block
  azs                   = local.availability_zones

  private_subnets       = local.private_subnets
  public_subnets        = local.public_subnets

  public_subnet_suffix  = "public"
  private_subnet_suffix = "private"

  enable_nat_gateway    = true
  single_nat_gateway    = true

  tags = local.tags
}

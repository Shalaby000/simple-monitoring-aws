provider "aws" {
  region = "us-east-1"
}  
module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = "eks-flask-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = "vpc-036837437d5c1173f"
  subnet_ids               = ["subnet-0acff22f083606bbf", "subnet-08775137440d679c5", "subnet-011e918ef4c8e2550"]
  control_plane_subnet_ids = ["subnet-0acff22f083606bbf", "subnet-08775137440d679c5", "subnet-011e918ef4c8e2550"]

  cluster_security_group_id = "sg-042ff619eafabdf4f"

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.micro"]
  }

  eks_managed_node_groups = {
    eks_nodegroup = {
      min_size     = 1
      max_size     = 2
      desired_size = 2
      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"
    }
  }
}
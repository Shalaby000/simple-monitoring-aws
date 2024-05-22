eprovider "aws" {
  region = "Enter Region"
}  
module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = "eks-flask-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = "Enter VPC ID"
  subnet_ids               = ["Enter Subnet ID", "Another Subnet ID"]
  control_plane_subnet_ids = ["Enter Same Subnet ID", "Same Other Subnet ID"]

  cluster_security_group_id = "SG ID with Right Permissions"

  # EKS Managed Node Group
  eks_managed_node_group_defaults = {
    #no need to make it larger for this project
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

module "eks" {
    #  Import the module template
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 21.0"

    # this is for cluster information controle plane
    name               = local.name
    kubernetes_version = "1.33"

    endpoint_public_access = true

    vpc_id     = module.vpc.id
    subnet_ids = module.vpc.private_subnets

     # Addons
    addons = {
        vpc-cni = {
            most-recent = true
        }
        kube-proxy = {
            most-recent = true
        }
        coredns = {
            most-recent = true
        }
    }


    # control plane network
    control_plane_subnet_ids = module.vpc.intra_subnets

    # Managing nodes in the cluster
    
    eks_managed_node_groups = {
    example = {
      instance_types = ["t2.medium"]
      attach_cluster_primary_security_group = true

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }
  }

    tags ={
        Environment = local.env
        Terraform   = "true"
    }
}
infra_env             = "poc-2"
app_name              = "mlops-poc2"
vpc_cidr_block        = "10.0.0.0/16"


public_subnet_cidr_1  = "10.0.0.0/24"   # Range: 10.0.0.0 to 10.0.0.255
public_subnet_cidr_2  = "10.0.1.0/24"   # Range: 10.0.1.0 to 10.0.1.255
private_subnet_cidr_1 = "10.0.2.0/24"   # Range: 10.0.2.0 to 10.0.2.255
private_subnet_cidr_2 = "10.0.3.0/24"   # Range: 10.0.3.0 to 10.0.3.255

eks_version           = 1.35
node_instance_type    = "t2.medium"
node_volume_size      = 20
node_desired          = 1
node_min              = 1
node_max              = 2
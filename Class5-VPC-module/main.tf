module "vpc-july" {
    source = "dennian123/vpc-july/module"
    version = "0.0.2"
    region = "us-east-2"
    subnet_cidr1 = "10.0.101.0/24"
    subnet_cidr2 = "10.0.2.0/24"
    subnet_cidr3 = "10.0.3.0/24"
    az1 = "us-east-2a"
    az2 = "us-east-2b"
    az3 = "us-east-2c"
    ip_on_launch = true
    instance_type = "t2.micro"
}
terraform {
    source = "../../../../module//subnet"
}

include {
    path = find_in_parent_folders()
}


// we use 10.0.0.0/16 on the VPC so we want to divide into two /24 subnets
inputs = {
    vpc_id = "vpc-0657da7312c27aecf"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    subnet_name = "public-subnet"
}

// subnet-0ac3c83269b442b2e
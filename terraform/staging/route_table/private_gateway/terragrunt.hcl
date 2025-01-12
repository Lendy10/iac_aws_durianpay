terraform {
    source = "../../../../module//route_table"
}

include {
    path = find_in_parent_folders()
}

// Create a Route Table for the Private Subnet: This route table will route traffic from the private subnet to the NAT Gateway.

inputs = {
    vpc_id = "vpc-0657da7312c27aecf"
    internet_gateway_id = "igw-044abb453d0962b5e"
    subnet_id = "subnet-065cf22eb7d3fd8d6"
    route_table_name = "private-route-table"
}

//route_table_id rtb-0067686903a7466e9
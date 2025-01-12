terraform {
    source = "../../../module//internet_gateway"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    vpc_id = "vpc-0657da7312c27aecf"
    subnet_id = "subnet-0ac3c83269b442b2e"
}

// igw-044abb453d0962b5e
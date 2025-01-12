terraform {
    source = "../../../../module//vpc"
}

include {
    path = find_in_parent_folders()
}

// this has 65534 available IPs 
inputs = {
    vpc_name = "vpc-durianpay"
    cidr_block = "10.0.0.0/16"
}
terraform {
    source = "../../../module//security_group"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    vpc_id = "vpc-0657da7312c27aecf"
}

// sg-0d899e6fed29e23ac
terraform {
    source = "../../../../module//launch_template"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    launch_template_name = "durianpay-launch-configuration"
    ami_id = "ami-0198a868663199764"
    instance_type = "t2.medium"
    security_groups_id = "sg-0d899e6fed29e23ac"
    volume_size = 30
    cloudwatch_profile_name = "terraform-instance-cloudwatch"
}

// lt-0726cecbdc3959069
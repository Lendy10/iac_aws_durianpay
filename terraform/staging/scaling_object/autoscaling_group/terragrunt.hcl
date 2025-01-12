terraform {
    source = "../../../../module//autoscaling_group"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    launch_template_id = "lt-0726cecbdc3959069"
    min_size = 2
    max_size = 5
    private_subnet_id = "subnet-065cf22eb7d3fd8d6"
    autoscaling_group_tag_key = "terraform"
    autoscaling_group_tag_value = "True"
}

// terraform-20250112142405224700000001
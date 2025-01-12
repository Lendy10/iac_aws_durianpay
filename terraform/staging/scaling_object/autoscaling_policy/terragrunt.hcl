terraform {
    source = "../../../../module//autoscaling_policy"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    autoscaling_policy_name = "durianpay-autoscaling-policy"
    autoscaling_group_name = "terraform-20250112142405224700000001"
}
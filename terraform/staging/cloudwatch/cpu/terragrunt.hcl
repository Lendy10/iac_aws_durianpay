terraform {
    source = "../../../../module//cloudwatch"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    alarm_name = "cpu-usage-alert"
    evaluation_periods = 2
    metric_name = "CPUUtilization"
    threshold = 80
    autoscaling_policy_arn = "arn:aws:autoscaling:ap-southeast-1:593793060241:scalingPolicy:5347db8d-c790-43e8-9e68-341ed6d1e23c:autoScalingGroupName/terraform-20250112142405224700000001:policyName/durianpay-autoscaling-policy"
    autoscaling_group_name = "terraform-20250112142405224700000001"
}
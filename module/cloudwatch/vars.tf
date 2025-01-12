variable "region" {
  type = string
}

variable "arn" {
  type = string
}

variable "alarm_name" {
  type = string
}

variable "evaluation_periods" {
  type = number
}

variable "metric_name" {
  type = string
}

variable "threshold" {
  type = number
}

variable "autoscaling_policy_arn" {
  type = string
}

variable "autoscaling_group_name" {
  type = string
}

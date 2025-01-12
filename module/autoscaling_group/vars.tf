variable "region" {
  type = string
}

variable "arn" {
  type = string
}


variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "private_subnet_id" {
  type = string
}

variable "autoscaling_group_tag_key" {
  type = string
}

variable "autoscaling_group_tag_value" {
  type = string
}

variable "launch_template_id" {
  type = string
}

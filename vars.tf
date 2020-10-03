variable "name_prefix" {
  description = "Name associated with the autoscaling group"
}

variable "asg_min" {
  description = "Minimum number of instances required in the ASG"
  default     = 0
}

variable "asg_max" {
  description = "Maximum number of instances required in the ASG"
  default     = 0
}

variable "asg_desired" {
  description = "Desired number of instances in the ASG"
  default     = 0
}

variable "launch_template_name" {
  description = "Name of a launch template used to provision instances"
}

variable "schedule_up" {
  description = "A cron expression describing when the ASG should be scaled up based on the specified min, max, desired values"
  default     = null
}

variable "schedule_down" {
  description = "A cron expression describing when the ASG should be scaled down to zero instances (i.e. when not required)"
  default     = null
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
  default     = null
}

variable "subnets" {
  description = "Subnets to deploy into"
  default     = null
}

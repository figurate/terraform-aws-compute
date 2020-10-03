variable "name_prefix" {
  description = "Name associated with the autoscaling group"
  default     = "nginx"
}

variable "asg_min" {
  description = "Minimum number of instances required in the ASG"
  default     = 1
}

variable "asg_max" {
  description = "Maximum number of instances required in the ASG"
  default     = 2
}

variable "asg_desired" {
  description = "Desired number of instances in the ASG"
  default     = 1
}

variable "launch_template_name" {
  description = "Name of a launch template used to provision instances"
  default     = "example-nginx"
}

variable "schedule_up" {
  description = "A cron expression describing when the ASG should be scaled up based on the specified min, max, desired values"
  default     = "30 21 * * 0-4"
}

variable "schedule_down" {
  description = "A cron expression describing when the ASG should be scaled down to zero instances (i.e. when not required)"
  default     = "30 11 * * *"
}

module "autoscaling" {
  source = "../.."

  name_prefix          = var.name_prefix
  launch_template_name = var.launch_template_name
  asg_min              = var.asg_min
  asg_max              = var.asg_max
  asg_desired          = var.asg_desired
  schedule_up          = var.schedule_up
  schedule_down        = var.schedule_down
}

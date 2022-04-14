/**
 * # AWS AutoScaling Group
 *
 * [![CI](https://github.com/figurate/terraform-aws-autoscaling-group/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-autoscaling-group/actions/workflows/main.yml)
 *
 *
 * ![AWS AutoScaling Group](aws_autoscaling_group.png)
 */
data "aws_availability_zones" "available" {
  all_availability_zones = true
}

data "aws_vpc" "vpc" {
  count = var.vpc != null ? 1 : 0
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

data "aws_subnets" "subnets" {
  count = var.vpc != null ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc[0].id]
  }
  tags = {
    Name = var.subnets
  }
}

resource "aws_autoscaling_group" "autoscaling" {
  name_prefix      = "${var.name_prefix}-"
  max_size         = var.asg_max
  min_size         = var.asg_min
  desired_capacity = var.asg_desired

  vpc_zone_identifier = var.vpc != null ? data.aws_subnets.subnets[0].ids : null
  availability_zones  = var.vpc == null ? data.aws_availability_zones.available.zone_ids : null

  launch_template {
    name    = var.launch_template_name
    version = "$Latest"
  }
}

resource "aws_autoscaling_schedule" "autoscaling_up" {
  count                  = var.schedule_up != null ? 1 : 0
  scheduled_action_name  = "autoscaling_up"
  min_size               = var.asg_min
  max_size               = var.asg_max
  desired_capacity       = var.asg_desired
  recurrence             = var.schedule_up
  autoscaling_group_name = aws_autoscaling_group.autoscaling.name
}

resource "aws_autoscaling_schedule" "autoscaling_down" {
  count                  = var.schedule_down != null ? 1 : 0
  scheduled_action_name  = "autoscaling_down"
  min_size               = 0
  max_size               = var.asg_max
  desired_capacity       = 0
  recurrence             = var.schedule_down
  autoscaling_group_name = aws_autoscaling_group.autoscaling.name
}

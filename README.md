# AWS AutoScaling Group

![AWS AutoScaling Group](aws\_autoscaling\_group.png)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| asg\_desired | Desired number of instances in the ASG | `number` | `0` | no |
| asg\_max | Maximum number of instances required in the ASG | `number` | `0` | no |
| asg\_min | Minimum number of instances required in the ASG | `number` | `0` | no |
| launch\_template\_name | Name of a launch template used to provision instances | `any` | n/a | yes |
| name\_prefix | Name associated with the autoscaling group | `any` | n/a | yes |
| schedule\_down | A cron expression describing when the ASG should be scaled down to zero instances (i.e. when not required) | `any` | `null` | no |
| schedule\_up | A cron expression describing when the ASG should be scaled up based on the specified min, max, desired values | `any` | `null` | no |
| subnets | Subnets to deploy into | `any` | `null` | no |
| vpc | Name of the VPC to deploy to | `any` | `null` | no |

## Outputs

No output.


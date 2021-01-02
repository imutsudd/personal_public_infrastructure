terraform {
  required_version = ">=0.12, < 0.13"
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
  }
}

locals {
  container_definition = templatefile(var.task_definition_template_file, {
    service: var.ecs_service_name,
    task_port: var.task_port,
    task_protocol: var.task_protocol,
    task_definition_image_url: var.task_definition_image_url,
    aws_region: var.aws_region
    cloud_watch_log_group: var.cloud_watch_log_group
    cpu : var.cpu,
    memory: var.memory
  })
}

module "alb_ecs_nicks_personal_front_end" {
  source = "github.com/nickolasteixeira/personal_terraform_modules//modules/aws/networking/alb/front-end-app?ref=v0.0.6"
  acm_domain_certificate = var.acm_domain_certificate_url
  alb_name = var.alb_name
  target_type = var.target_type
  internal = var.internal
}

module "ecs_nicks_personal_front_end" {
  source = "github.com/nickolasteixeira/personal_terraform_modules//modules/aws/ecs-cluster?ref=v0.0.6"
  aws_account_id = var.aws_account_id
  aws_region =  var.aws_region
  cloud_watch_log_group = var.cloud_watch_log_group
  cloud_watch_log_stream = var.cloud_watch_log_stream
  cpu = var.cpu
  desired_count = var.desired_count
  ecs_cluster_name = var.ecs_cluster_name
  ecs_security_groups = [module.alb_ecs_nicks_personal_front_end.alb_security_group]
  ecs_service_name = var.ecs_service_name
  launch_type = var.launch_type
  memory = var.memory
  network_mode = var.network_mode
  scheduling_strategy = var.scheduling_strategy
  task_definition_image_url = var.task_definition_image_url
  task_definition_template_file = var.task_definition_template_file
  task_port = var.task_port
  task_protocol = var.task_protocol
  container_definitions = local.container_definition
  alb_target_group_arn = module.alb_ecs_nicks_personal_front_end.alb_arn
}


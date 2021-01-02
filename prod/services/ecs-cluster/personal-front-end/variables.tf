# -------------------
# -- AWS ACCOUNT INFO
# -------------------

variable "aws_account_id" {
  description = "Your AWS Account Id"
  type = string
}
variable "aws_region" {
  description = "AWS Region to apply resources to"
  type = string
}

# ------------------
# -- AWS CLOUD WATCH
# ------------------
variable "cloud_watch_log_group" {
  description = "Name of your cloud watch log group"
  type = string
}

variable "cloud_watch_log_stream" {
  description = "Name of your cloud watch log stream"
  type = string
}
# ------------------
# -- ALB ECS CLUSTER
# ------------------
# ---------------------------------------------------------------------------------------------------------------------
variable "alb_name" {
  description = "Name of the ALB for ECS Service"
  type = string
}

variable "acm_domain_certificate_url" {
  description = "acm_domain_certificate URL"
  type = string
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
  type = string
  default = "ip"
}

variable "internal" {
  description = "ALB internal in VPC vs external internet facing"
  type = bool
  default = false
}


# --------------
# -- ECS CLUSTER
# --------------
# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "ecs_cluster_name" {
  description = "The AWS ECS Cluster Name"
  type = string
}


# --------------
# -- ECS SERVICE
# --------------
# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "ecs_service_name" {
  description = "The ECS Service Name"
  type = string
}


# ---------------
# -- ECS TASK DEF
# ---------------
# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------


# -- Container definitions
variable "task_definition_template_file" {
  description = "Relative path from module to your task definition"
  type = string
  default = "./task_definitions/personal_front_end.json"
}

variable "task_port" {
  description = "Port to run your task on for ECS service"
  type = number
  default = 80
}

variable "task_protocol" {
  description = "Protocol to run your task on for ECS service"
  type = string
  default = "tcp"
}

variable "task_definition_image_url" {
  description = "Task definition Image URL"
  type = string
}

variable "desired_count" {
  description = "Number of running tasks desired for your service"
  type = number
  default = 2
}

variable "launch_type" {
  description = "AWS ECS Launch type - FARGATE OR EC2"
  type = string
  default = "FARGATE"
}

variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service."
  type = string
  default = "REPLICA"
}

variable "network_mode" {
  description = "The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host."
  type = string
  default = "awsvpc"
}


variable "cpu" {
  description = "CPU for ECS service"
  type = string
  default = "1024"
}

variable "memory" {
  description = "Memory for ECS Service"
  type = string
  default = "2048"
}

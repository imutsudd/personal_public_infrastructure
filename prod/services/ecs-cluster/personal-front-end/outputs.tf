output "alb_dns_name" {
  value = module.alb_ecs_nicks_personal_front_end.alb_dns_name
  description = "The domain name of the load balancer"
}

output "alb_security_group" {
  value = module.alb_ecs_nicks_personal_front_end.alb_security_group
  description = "The security group id of the ALB"
}

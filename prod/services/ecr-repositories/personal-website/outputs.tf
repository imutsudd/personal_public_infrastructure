output "registry_id" {
  description = "The account ID of the registry holding the repository."
  value = module.ecr_repository_personal_website.registry_id
}

output "repository_url" {
  description = "The URL of the repository."
  value = module.ecr_repository_personal_website.repository_url
}
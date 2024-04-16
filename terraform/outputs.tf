output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane created by default"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region were resources are going to be created"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.cactustech-ecr.repository_url
}
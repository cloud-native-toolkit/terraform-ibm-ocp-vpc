output "id" {
  value       = data.ibm_container_cluster_config.cluster.id
  description = "ID of the cluster."
  depends_on  = [helm_release.cloud_setup]
}

output "name" {
  value       = local.cluster_name
  description = "Name of the cluster."
}

output "resource_group_name" {
  value       = var.resource_group_name
  description = "Name of the resource group containing the cluster."
  depends_on  = [helm_release.cloud_setup]
}

output "region" {
  value       = var.region
  description = "Region containing the cluster."
  depends_on  = [helm_release.cloud_setup]
}

output "config_file_path" {
  value       = local.cluster_config
  description = "Path to the config file for the cluster."
  depends_on  = [helm_release.cloud_setup]
}

output "platform" {
  value = {
    id         = data.ibm_container_cluster_config.cluster.id
    kubeconfig = local.cluster_config
    type       = local.cluster_type
    type_code  = local.cluster_type_code
    version    = local.cluster_version
    ingress    = local.ingress_hostname
    tls_secret = local.tls_secret
  }
  description = "Configuration values for the cluster platform"
  depends_on  = [helm_release.cloud_setup]
}

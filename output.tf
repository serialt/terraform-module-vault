output "name" {
  value = var.name
}

output "namespace" {
  value = helm_release.vault.metadata[0].namespace
}

output "release_name" {
  value = helm_release.vault.name
}

output "chart_version" {
  value = helm_release.vault.metadata[0].version
}

output "app_version" {
  value = helm_release.vault.metadata[0].app_version
}

output "service_port" {
  value = var.port
}

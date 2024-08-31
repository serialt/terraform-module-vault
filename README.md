# README
A Terraform module to install Vault

## Providers
* hashicorp/helm

## Resources
* helm_release.vault

## Inputs

* helm_repository
* chart_version
* name
* namespace
* mirror
* imagePullSecrets
* replicas
* port
* persistence
* tolerations
* resources
* backend
* injector
* csi
* ingress

## Outputs
- name
- namespace
- release_name
- chart_version
- app_version
- service_port

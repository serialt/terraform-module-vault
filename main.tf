locals {
  values = {
    fullnameOverride = var.name
    global = {
      imagePullSecrets = var.imagePullSecrets
    }
    server = {
      image = {
        repository =  "${var.mirror}/vault"
      }
      ingress = {
        enabled = var.ingress.enabled
        ingressClassName = var.ingress.ingressClassName
        hosts = var.ingress.hosts
        tls = var.ingress.tls
      }
      standalone = {
        config = <<-EOT
          ui = true
          listener "tcp" {
            tls_disable = 1
            address = "[::]:${var.port}"
            cluster_address = "[::]:8201"
          }
          ${var.backend}
        EOT
      }
      ha = {
        replicas = var.replicas
      }
      dataStorage = {
        enabled = var.persistence.enabled
      }
      serviceAccount = {
        create = true
        name   = var.name
      }
      tolerations = var.tolerations
    }
    ui = {
      enabled = false
    }
    injector = {
      enabled = var.injector
      image = {
        repository =  "${var.mirror}/vault-k8s"
      }
      agentImage ={
        repository = "${var.mirror}/vault"
      }
    }
    csi = {
      enabled = var.csi.enabled
      image = {
        repository = "${var.mirror}/vault-csi-provider"
      }
      agent = {
        image = {
          repository = "${var.mirror}/vault"
        }
      }
    }
  }
}

resource "helm_release" "vault" {
  name          = var.name
  namespace     = var.namespace
  chart         = "vault"
  version       = var.chart_version
  repository    = var.helm_repository
  recreate_pods = true

  values = [yamlencode(local.values)]
}



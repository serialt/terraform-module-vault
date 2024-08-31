variable "helm_repository" {
  type    = string
  default = "https://helm.releases.hashicorp.com"
}

variable "chart_version" {
  type    = string
  default = ""
}

variable "name" {
  type    = string
  default = "vault"
}

variable "namespace" {
  type    = string
  default = ""
}

variable "mirror" {
  type = string
  default = "docker.io/hashicorp"
}
variable "imagePullSecrets" {
  type = any
  default = []
}

variable "replicas" {
  type    = number
  default = 2
}

variable "port" {
  type    = number
  default = 8200
}

variable "persistence" {
  type = map(any)
  default = {
    enabled = false
    pvc_uid = ""
  }
}

variable "tolerations" {
  type = any
  default = [{
    key      = "group"
    operator = "Equal"
    value    = "common"
    effect   = "NoSchedule"
  }]
}

variable "resources" {
  type    = any
  default = {}
}

variable "backend" {
  type    = string
  default = ""
}

variable "injector" {
  type    = bool
  default = false
}

variable "csi" {
  type = any 
  default = {
    enabled = false
  }
}


variable "ingress" {
  type = any
  default = {
    enabled = false
    ingressClassName = ""
    hosts = [
        {
          host = "chart-example.local"
        }
      ]
      tls = []
  }
}
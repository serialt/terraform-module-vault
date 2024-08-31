
variable "kubeconfig" {
  type    = string
  default = "~/.kube/config"

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
module "vault" {
  source          = "../"
  helm_repository = "https://helm.releases.hashicorp.com"
  name            = "vault"
  namespace       = "common"
  backend         = <<EOT
storage "file" {
    path = "/vault/data"
}
EOT
  resources       = {}
  mirror = "registry.cn-hangzhou.aliyuncs.com/serialt"
  ingress = {
    enabled = true
    ingressClassName = "traefik"
    hosts = [
        {
          host = "vault.ct.local.com"
        }
      ]
      tls = []
  }

  



}

locals {
  secret_provider_deployment_tempalate = templatefile("${path.module}/deployment_template.yaml", {
    name                  = var.name
    namespace             = var.namespace
  })
}

resource "kubectl_manifest" "binding_deployment" {
  yaml_body = local.secret_provider_deployment_tempalate

  wait = true
}
data "azurerm_kubernetes_cluster" "cluster" {
  name                = "cloudshellpocaks"
  resource_group_name = "container-cloud-shell-poc"
}

resource "kubernetes_namespace" "example" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "terraform-example-namespace"
  }
}

module "test_deployment" {
  source = "./dependecy_deployment"

  name = "test"
  namespace = "terraform-example-namespace"
}
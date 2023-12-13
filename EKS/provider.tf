provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "apply_kubernetes_manifest" {
  provisioner "local-exec" {
    command = "kubectl apply -f k8s/deployment.yml"
  }
}

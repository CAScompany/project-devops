provider "aws" {
  region = "us-east-1"
}


resource "null_resource" "apply_kubernetes_lb" {
  provisioner "local-exec" {
    command = "kubectl apply -f servicelb.yml"
  }
}

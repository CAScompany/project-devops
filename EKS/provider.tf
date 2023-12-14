provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "apply_kubernetes_manifest" {
  count = 3  

  provisioner "local-exec" {
    command = "kubectl apply -f deployment${count.index + 1}.yml"  
  }
}

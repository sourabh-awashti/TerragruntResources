output "test-module" {
  value = "test-modue"
}

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    cluster_instance_ids = "cluster_instance_ids"
  }
}

variable "master_node" {
  description = "k8s master control plane"
  type = object({
    host        = string
    user        = string
    private_key = string
  })
}
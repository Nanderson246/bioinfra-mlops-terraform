output "hpc_target" {
  value = "${var.hpc_user}@${var.hpc_host}"
}

output "ssh_command" {
  value = "ssh -i ${var.ssh_private_key} ${var.hpc_user}@${var.hpc_host}"
}


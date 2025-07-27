output "vm_name" {
  value = azurerm_linux_virtual_machine.ml_vm.name
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.ml_vm.public_ip_address
}

output "ssh_command" {
  value = "ssh ${var.admin_username}@${azurerm_linux_virtual_machine.ml_vm.public_ip_address}"
}


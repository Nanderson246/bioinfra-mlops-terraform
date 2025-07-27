provider "null" {}

provider "ssh" {
  alias  = "hpc"
  host   = var.hpc_host
  user   = var.hpc_user
  port   = var.hpc_ssh_port
  agent  = true
}

resource "null_resource" "hpc_setup" {
  provisioner "remote-exec" {
    inline = [
      "echo 'Connected to HPC: $(hostname)'",
      "mkdir -p ~/bioinfra_envs",
      "module load python/3.10",
      "python3 -m venv ~/bioinfra_envs/ml_env"
    ]

    connection {
      type        = "ssh"
      host        = var.hpc_host
      user        = var.hpc_user
      port        = var.hpc_ssh_port
      private_key = file(var.ssh_private_key)
    }
  }
}


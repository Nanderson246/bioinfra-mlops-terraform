provider "google" {
  project = var.project
  region  = var.region
}

resource "google_compute_instance" "ml_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  attached_disk {
    source      = google_compute_disk.data_disk.name
    device_name = "data-disk"
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update
    apt install -y python3-pip git docker.io
    pip3 install mlflow scikit-learn pandas boto3
  EOF

  # Optional GPU settings (Uncomment if needed)
  # guest_accelerator {
  #   type  = "nvidia-tesla-t4"
  #   count = 1
  # }

  # metadata = {
  #   "install-nvidia-driver" = "true"
  # }

  tags = ["mlops", "bioinformatics"]
}

resource "google_compute_disk" "data_disk" {
  name  = "${var.instance_name}-data-disk"
  type  = "pd-ssd"
  zone  = var.zone
  size  = 100 # GB
}


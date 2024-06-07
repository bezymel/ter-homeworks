resource "yandex_compute_instance" "web" {
  count = 2

  name         = "web-${count.index + 1}"
  zone         = var.default_zone
  platform_id  = "standard-v2"

  resources {
    cores         = var.web_cores
    core_fraction = var.web_core_fraction
    memory        = var.web_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id         = var.subnet_id
    security_group_ids = [var.security_group_id]
  }

    metadata = {
      ssh-keys = local.ssh_key
  }

  depends_on = [yandex_compute_instance.database]
}

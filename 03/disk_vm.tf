resource "yandex_vpc_network" "default" {
  name = "default-network"
}

resource "yandex_vpc_subnet" "default" {
  name           = "default-subnet"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

resource "yandex_compute_disk" "disk" {
  count       = 3
  name        = "disk-${count.index + 1}"
  description = "Virtual disk ${count.index + 1}"
  size        = 1

  zone        = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name         = "storage"
  platform_id  = "standard-v2"
  zone         = var.default_zone
  folder_id    = var.folder_id
  description  = "Storage VM"

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
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk
    content {
      disk_id = secondary_disk.value.id
      mode    = "READ_WRITE"
    }
  }
}

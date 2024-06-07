resource "yandex_compute_instance" "database" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name         = each.value.vm_name
  zone         = var.default_zone
  platform_id  = "standard-v2"

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id         = var.subnet_id
    security_group_ids = [var.security_group_id]
  }
}

resource "local_file" "ansible_inventory_file" {
  content  = templatefile("${path.module}/hosts.tpl",
    {
      web = yandex_compute_instance.web,
      database = yandex_compute_instance.database,
      storage = [yandex_compute_instance.storage]
    }
  )
  filename = "${path.module}/ansible_inventory"
}

output "ansible_inventory" {
  value = local_file.ansible_inventory_file.content
}

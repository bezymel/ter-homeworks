data "template_file" "ansible_inventory" {
  template = <<EOT
[webservers]
${join("\n", yandex_compute_instance.web.*.name)}

[databases]
${join("\n", yandex_compute_instance.db.*.name)}

[storages]
${join("\n", yandex_compute_instance.storage.*.name)}
EOT
}

resource "local_file" "ansible_inventory" {
  content  = data.template_file.ansible_inventory.rendered
  filename = "${path.module}/ansible_inventory"
}

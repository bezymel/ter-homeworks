data "template_file" "ansible_inventory" {
  template = <<EOT
[webservers]
${join("\n", var.webservers)}

[databases]
${join("\n", var.databases)}

[storages]
${join("\n", var.storages)}
EOT
}

resource "local_file" "ansible_inventory" {
  content  = data.template_file.ansible_inventory.rendered
  filename = "${path.module}/hosts"
}

variable "webservers" {
  default = ["web1", "web2"]
}

variable "databases" {
  default = ["db1", "db2"]
}

variable "storages" {
  default = ["storage1", "storage2"]
}

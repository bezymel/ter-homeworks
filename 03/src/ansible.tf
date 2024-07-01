resource "local_file" "ansible_inventory" {
  content = <<-EOT
  %{if length(yandex_compute_instance.web) > 0}
  [webservers]
  %{for i in yandex_compute_instance.web}
  ${i.name} ansible_host=${i.network_interface.0.nat_ip_address} fqdn=${i.name}
  %{endfor}
  %{endif}

  %{if length(yandex_compute_instance.database) > 0}
  [databases]
  %{for i in yandex_compute_instance.database}
  ${i.value.name} ansible_host=${i.value.network_interface.0.nat_ip_address} fqdn=${i.value.name}
  %{endfor}
  %{endif}

  %{if length(yandex_compute_instance.storage) > 0}
  [storage]
  %{for i in yandex_compute_instance.storage}
  ${i.name} ansible_host=${i.network_interface.0.nat_ip_address} fqdn=${i.name}
  %{endfor}
  %{endif}
  EOT
  filename = "${abspath(path.module)}/hosts"
}

output "ansible_inventory" {
  value = local_file.hosts_for_ansible.content
}

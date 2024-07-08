token  =  "your token"
cloud_id  = "your cloud_id"
folder_id = "your folder_id"
security_group_id = "your security_group_id"
subnet_id = "your subnet_id"
ssh_key = "your ssh_key"
each_vm = [
  {
    vm_name = "main"
    cpu = 2
    ram = 2
    disk_volume = 10
  },
  {
    vm_name = "replica"
    cpu = 2
    ram = 2
    disk_volume = 30
  }
]
}

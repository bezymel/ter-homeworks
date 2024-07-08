locals {
  each_vm = {
    main = {
      cpu = 2
      ram = 2
      disk_volume = 10
    },
    replica = {
      cpu = 2
      ram = 2
      disk_volume = 30
    }
  }
}

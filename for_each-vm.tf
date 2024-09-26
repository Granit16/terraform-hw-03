resource "yandex_compute_instance" "db" {
  # each_vm = [ { vm_name="main", cpu=2, ram=1, disk_volume=5 }, { vm_name="replica", cpu=1, ram=2, disk_volume=7 } ]
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name = "${each.value.vm_name}"
  platform_id = "standard-v2"

  resources {
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }

#  metadata = {
#    user-data = "ubuntu:${local.vms_ssh_root_key}"
#  }

  metadata = local.vms_metadata
}

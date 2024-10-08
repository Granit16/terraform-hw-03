resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name = "${each.value.vm_name}"
  platform_id = var.platform_id

  resources {
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = var.web_cfg.core_fraction
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

  metadata = local.vms_metadata
}

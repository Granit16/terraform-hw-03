data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_ubuntu_2004
}


resource "yandex_compute_instance" "web" {
  count = 2
  name = "web-${ count.index + 1 }"
  platform_id = var.platform_id

  resources {
    cores = var.web_cfg.cores
    memory = var.web_cfg.memory
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
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

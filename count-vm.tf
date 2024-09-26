data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_ubuntu_2004
}


resource "yandex_compute_instance" "web" {
  count = 2
  name = "web-${ count.index + 1 }"
  platform_id = "standard-v2"

  resources {
    cores = 2
    memory = 1
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

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

#  depends_on = [ yandex_compute_instance.web ]
  
}

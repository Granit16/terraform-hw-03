resource "yandex_compute_disk" "volume" {
  count = 3

  name = "disk-${ count.index }"
  type       = "network-hdd"
  zone       = "ru-central1-a"
  size       = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
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
  
  dynamic secondary_disk {
    for_each = yandex_compute_disk.volume
    
    content {
      disk_id = secondary_disk.value.id
    }
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }

}

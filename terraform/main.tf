

# Создание сети
resource "yandex_vpc_network" "network" {
  name = "${var.instance_name_prefix}-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.instance_name_prefix}-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# Мастер-узел Kubernetes
resource "yandex_compute_instance" "k8s-master" {
  name        = "${var.instance_name_prefix}-master"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8gk6f87bbfmuctfl6t" # Ubuntu 20.04 LTS
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("id_rsa.pub")}"
  }

  labels = {
    role = "k8s-master"
  }
}

# Рабочий узел Kubernetes
resource "yandex_compute_instance" "k8s-app" {
  name        = "${var.instance_name_prefix}-app"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8gk6f87bbfmuctfl6t" # Ubuntu 20.04 LTS
      size     = 40
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("id_rsa.pub")}"
  }

  labels = {
    role = "k8s-app"
  }
}

# Служебный сервер srv
resource "yandex_compute_instance" "srv" {
  name        = "${var.instance_name_prefix}-srv"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 16
  }

  boot_disk {
    initialize_params {
      image_id = "fd8gk6f87bbfmuctfl6t" # Ubuntu 20.04 LTS
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("id_rsa.pub")}"
  }

  labels = {
    role = "srv"
  }
}

# Вывод IP-адресов
output "k8s_master_ip" {
  value = yandex_compute_instance.k8s-master.network_interface[0].nat_ip_address
}

output "k8s_app_ip" {
  value = yandex_compute_instance.k8s-app.network_interface[0].nat_ip_address
}

output "srv_ip" {
  value = yandex_compute_instance.srv.network_interface[0].nat_ip_address
}

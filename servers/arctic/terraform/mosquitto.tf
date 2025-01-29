resource "null_resource" "create_mosquitto_dir" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/mosquitto/config && mkdir -p /home/foxleigh81/shares/appdata/mosquitto/data && mkdir -p /home/foxleigh81/shares/appdata/mosquitto/log"
  }
}

resource "null_resource" "fix_mosquitto_permissions" {
  depends_on = [null_resource.create_mosquitto_dir]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/mosquitto"
  }
}

resource "docker_volume" "mosquitto" {
  name = "mosquitto"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/mosquitto"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "mosquitto" {
  name  = "mosquitto"
  image = "eclipse-mosquitto:latest"
  restart = "unless-stopped"

  network_mode = "host"

  volumes {
    volume_name    = docker_volume.mosquitto.name
    container_path = "/mosquitto"
  }

  env = [
    "TZ=Europe/London"
  ]

  privileged = true
}
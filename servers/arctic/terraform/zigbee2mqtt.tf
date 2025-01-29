resource "null_resource" "create_zigbee2mqtt_dir" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/zigbee2mqtt"
  }
}

resource "null_resource" "fix_zigbee2mqtt_permissions" {
  depends_on = [null_resource.create_zigbee2mqtt_dir]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/zigbee2mqtt"
  }
}


resource "docker_volume" "zigbee2mqtt" {
  name = "zigbee2mqtt"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/zigbee2mqtt"
    o      = "bind"
    type   = "none"
  }
}


resource "docker_container" "zigbee2mqtt" {
  name  = "zigbee2mqtt"
  image = "koenkk/zigbee2mqtt:latest"
  restart = "unless-stopped"

  network_mode = "host"

  volumes {
    volume_name    = docker_volume.zigbee2mqtt.name
    container_path = "/app/data"
  }

  devices {
    host_path      = "/dev/ttyUSB0"
    container_path = "/dev/ttyUSB0"
  }

  env = [
    "TZ=Europe/London"
  ]

  privileged = true
}
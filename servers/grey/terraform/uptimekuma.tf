resource "null_resource" "create_uptime_kuma_dirs" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/uptime_kuma"
  }
}

resource "null_resource" "fix_uptime_kuma_permissions" {
  depends_on = [null_resource.create_uptime_kuma_dirs]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/uptime_kuma"
  }
}

resource "docker_volume" "uptime_kuma_data" {
  name = "uptime_kuma_data"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/uptime_kuma"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "uptime_kuma" {
  name  = "uptime_kuma"
  image = "docker.io/louislam/uptime-kuma:latest"
  restart = "unless-stopped"
  network_mode = "host"

  mounts {
    target = "/data"
    source = docker_volume.uptime_kuma_data.name
    type   = "volume"
  }

  env = [
    "TZ=Europe/London"
  ]
}
resource "null_resource" "create_matter_dir" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/matter-server"
  }
}

resource "null_resource" "fix_matter_permissions" {
  depends_on = [null_resource.create_matter_dir]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/matter-server"
  }
}

resource "docker_container" "matter_server" {
  name         = "matter-server"
  image        = "ghcr.io/home-assistant-libs/python-matter-server:7.0.1"
  restart      = "unless-stopped"
  network_mode = "host"

  mounts {
    target = "/data"
    source = "/home/foxleigh81/shares/appdata/matter-server"
    type   = "bind"
  }

  env = [
    "TZ=Europe/London"
  ]
}
resource "null_resource" "create_node_red_dir" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/node-red"
  }
}

resource "null_resource" "fix_node_red_permissions" {
  depends_on = [null_resource.create_node_red_dir]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/node-red"
  }
}

resource "docker_volume" "node_red" {
  name = "node_red"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/node-red"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "node_red" {
  name  = "node-red"
  image = "nodered/node-red:4.0.8-22"
  restart = "unless-stopped"
  network_mode = "host"  # ← This enables host networking

  volumes {
    volume_name    = docker_volume.node_red.name
    container_path = "/data"
  }

  env = [
    "TZ=Europe/London"
  ]
}
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

resource "docker_container" "node_red" {
  name         = "node-red"
  image        = "nodered/node-red:4.0.8-22"
  restart      = "unless-stopped"
  network_mode = "host"

  mounts {
    target = "/data"
    source = "/home/foxleigh81/shares/appdata/node-red"
    type   = "bind"
  }

  env = [
    "TZ=Europe/London"
  ]
}
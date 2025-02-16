resource "null_resource" "create_tailscale_dirs" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/tailscale"
  }
}

resource "null_resource" "fix_tailscale_permissions" {
  depends_on = [null_resource.create_tailscale_dirs]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/tailscale"
  }
}

resource "docker_volume" "tailscale_data" {
  name = "tailscale_data"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/tailscale"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "tailscale" {
  name  = "tailscale"
  image = "ghcr.io/tailscale/tailscale:latest"
  restart = "unless-stopped"
  network_mode = "host"

  mounts {
    target = "/data"
    source = docker_volume.tailscale_data.name
    type   = "volume"
  }

  env = [
    "TZ=Europe/London",
    "TS_AUTHKEY=${var.tailscale_auth_key}"
  ]
}
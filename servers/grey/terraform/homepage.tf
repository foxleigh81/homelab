resource "null_resource" "create_homepage_dirs" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/homepage/config /home/foxleigh81/shares/appdata/homepage/public"
  }
}

resource "null_resource" "fix_homepage_permissions" {
  depends_on = [null_resource.create_homepage_dirs]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/homepage"
  }
}

resource "docker_volume" "homepage_data" {
  name = "homepage_data"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/homepage/config"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_volume" "homepage_public" {
  name = "homepage_public"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/homepage/public"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "homepage" {
  name  = "homepage"
  image = "ghcr.io/gethomepage/homepage:latest"
  restart = "unless-stopped"
  network_mode = "host"

  mounts {
    target = "/app/config"
    source = docker_volume.homepage_data.name
    type   = "volume"
  }

  mounts {
    target = "/app/public"
    source = docker_volume.homepage_public.name
    type   = "volume"
  }

  env = [
    "TZ=Europe/London",
    "PORT=3030"
  ]
}
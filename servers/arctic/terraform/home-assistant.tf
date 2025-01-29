resource "null_resource" "create_home_assistant_dir" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/home-assistant"
  }
}

resource "null_resource" "fix_home_assistant_permissions" {
  depends_on = [null_resource.create_home_assistant_dir]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/home-assistant"
  }
}

resource "docker_volume" "home_assistant" {
  name = "home_assistant"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/home-assistant"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "home_assistant" {
  name  = "home-assistant"
  image = "ghcr.io/home-assistant/home-assistant:stable"
  restart = "unless-stopped"
  network_mode = "host"  # ← This enables host networking

  volumes {
    volume_name    = docker_volume.home_assistant.name
    container_path = "/config"
  }

  env = [
    "TZ=Europe/London"
  ]
}
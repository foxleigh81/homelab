resource "docker_volume" "home_assistant" {
  name = "home_assistant"
  driver_opts = {
    device = "/home/foxleigh81/shares/home-assistant"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "home_assistant" {
  name  = "home-assistant"
  image = "ghcr.io/home-assistant/home-assistant:stable"
  ports {
    internal = 8123
    external = 8123
  }

  volumes {
    volume_name    = docker_volume.home_assistant.name
    container_path = "/config"
  }

  env = [
    "TZ=Etc/UTC"
  ]
}
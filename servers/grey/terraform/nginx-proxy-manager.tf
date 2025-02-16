resource "null_resource" "create_nginx_proxy_manager_dirs" {
  provisioner "local-exec" {
    command = "mkdir -p /home/foxleigh81/shares/appdata/nginx-proxy-manager /home/foxleigh81/shares/appdata/nginx-proxy-manager/letsencrypt"
  }
}

resource "null_resource" "fix_nginx_proxy_manager_permissions" {
  depends_on = [null_resource.create_nginx_proxy_manager_dirs]

  provisioner "local-exec" {
    command = "chown -R nobody:nogroup /home/foxleigh81/shares/appdata/nginx-proxy-manager"
  }
}

resource "docker_volume" "npm_data" {
  name = "nginx_proxy_manager_data"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/nginx-proxy-manager"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_volume" "npm_letsencrypt" {
  name = "nginx_proxy_manager_letsencrypt"
  driver_opts = {
    device = "/home/foxleigh81/shares/appdata/nginx-proxy-manager/letsencrypt"
    o      = "bind"
    type   = "none"
  }
}

resource "docker_container" "nginx_proxy_manager" {
  name  = "nginx-proxy-manager"
  image = "docker.io/jc21/nginx-proxy-manager:latest"
  restart = "unless-stopped"
  network_mode = "host"

  mounts {
    target = "/data"
    source = docker_volume.npm_data.name
    type   = "volume"
  }

  mounts {
    target = "/etc/letsencrypt"
    source = docker_volume.npm_letsencrypt.name
    type   = "volume"
  }

  env = [
    "TZ=Europe/London"
  ]
}
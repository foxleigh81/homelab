# Arctic

This is my smart home server and is the first machine to be setup using GitOps, It is a Beelink Gemini T45 Mini PC. It was orignally part of a Kubernetes cluster but I decided to change that architecture to a simpler one (see the [Arctic ADR 2](./adr/arctic-002.md) for more information).

It is running on Ubuntu Server with Docker and is managed via Terraform and Ansible

## Services

- Portainer
- Home Assistant
- Node-Red
- Zigbee2MQTT
- VS Code (For config editing)

## Specs

- Intel Apollo Lake Pentium J4205 Quad Core @ 2600 MHz
- 8GB LPDDR3 RAM
- 250GB SSD

## Ansible

The OS level infrastructure is mananged by [Ansible](https://docs.ansible.com/). You can look at the [Ansible readme](./ansible/README.md) for more information.
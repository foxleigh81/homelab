# Ansible Configuration

This directory contains Ansible playbooks and roles to manage the Arctic and Grey servers.

## Inventory

- `inventories/foxnet.ini`: Defines the connection details for the servers.

## Playbooks

- `arctic.yml`: Main playbook to set up the arctic server with necessary packages
- `grey.yml`: Main playbook to set up the grey server with necessary packages

## Roles

### Common

- **Tasks**:
  - Update and upgrade apt packages.
  - Install required basic packages like `curl`, `git`, `unzip`, etc...
  - Installs `python3`, `pip3` and `python3-apt`
  - Installs and configures `docker` and `docker compose`
  - Installs `zsh` and configures it to use 'oh-my-zsh' and 'powerlevel10k'.

## Secrets

- `vars/secrets.yml`: Contains sensitive variables (encrypted with Ansible Vault).
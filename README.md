# Homelab (AKA The Foxnet 🦊)

## Servers

My homelab consists of 3 servers:

- [Fennec](./servers/fennec/README.md)
- [Grey](./servers/grey/README.md)
- [Arctic](./servers/arctic/README.md)

Did you spot the theme 😉

Each server has a unique job on my network, you can learn more about each server by clicking on the server name above.

## Architectural Decision Records (ADR's)

I've documented the decisions I've made about my servers in this repo. Not everything is documented as I've only started
capturing my decisions as of January 2025 although I've added a few back-dated ones for relative completeness.

You can view them in the [./adr] folder.

## GitOps

> Note: This section is - at least partly - a lie. It is aspirational rather than a true snapshot of my current state.
> Fennec and Grey currently have no connection to this repo. Grey should have in the coming days but Fennec probably won't
> for a considerable time.

Where possible. I'm using a [GitOps](https://www.gitops.tech/) workflow to manage my servers. 

For Fennec, this is not really true GitOps as Unraid manages all of the infrastructure, so I am just using CI/CD to keep the config files for some of the containers in sync (mostly just for backup purposes really). 

With Grey and Arctic, however, they utilise [Terraform](https://www.terraform.io/) and [Ansible](https://docs.ansible.com/) for provisioning and are fully managed using GitOps

## Monorepo

I went for a monorepo architecture in order to keep all of my homelab configs in one place. I could have split them into indivudal repos
but I didn't really see any benefit to doing that. Also, keeping everything in a single repo means I can point people to here
if I want to show off what I've done, rather than giving them multiple places to look.
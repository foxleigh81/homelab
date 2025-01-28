# ARCTIC ADR 002: Moving Away from Kubernetes

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![accepted]

## Context

Following [ADR 001: Kubernetes](./arctic-001.md), we initially deployed a Kubernetes cluster on Arctic to learn container orchestration and leverage GitOps workflows. However, our environment is inherently **low-scale**, running mostly **stateful home automation services** (Home Assistant, Zigbee2MQTT, etc.), making a multi-node cluster configuration less beneficial and more complex than necessary.

The more I learned about Kubernetes, the more I realised that in my day-to-day work, I don't need to get into the weeds of Kubernetes and the fairly high-level knowledge about pod management, services, ingress and general configuration is more than enough. 

## Decision Drivers

1. **Overkill for Homelab Needs**  
   We found that Kubernetes offered capabilities beyond our requirements, adding overhead in resource usage and operational complexity.  
   
2. **Stateful Concerns**  
   Managing databases, storage, and sensor data in a Kubernetes cluster often requires more advanced setups (PersistentVolumes, VolumeClaims, backups). Without replicas or high-availability needs, it was pointless to maintain cluster-level storage for just a single node or minimal replicas.

3. **I didn't need to go that deep**  
   As mentioned above, the deep complexities of Kubernetes are likely not going to be something I need to concern myself with as most of my
   day-to-day interaction with it would be via a cloud-based service like EKS, so I beleive the knowledge I gained from setting it all up is
   enough and the hassle of managing the deeper complexities over time is just not worth it when all I want is a stable smart-home server.

## Advice

1. **Simplify the Orchestration Layer**  
   Switch from Kubernetes to **standalone Docker** managed by **Terraform** for container provisioning, with **Ansible** handling OS-level tasks and configuration.

2. **Focus on Single Host Reliability**  
   Since we’re no longer replicating stateful services across multiple nodes, a robust backup approach (e.g., restic, duplicati) is more pertinent than cluster storage.

3. **Use Terraform for Infrastructure as Code**  
   Track Docker containers, volumes, and networks in `.tf` files. Reconcile changes via GitOps with a continuous integration pipeline.

4. **Use Ansible for Host Configuration**  
   - Install Docker or other dependencies on Ubuntu.
   - Manage user accounts, firewall settings, and any system packages.

## Decision

**Retire the Kubernetes cluster** on Arctic and move to a single-node Ubuntu environment with Terraform + Ansible. This reduces operational overhead, simplifies stateful container management, and eliminates unneeded complexity for a low-scale homelab. 

This partially supercedes [ADR 000](./arctic-000.md) as the Beelink SER5 and T34 are no longer needed as we are only going to use the Beelink T45 for this server.

## Consequences

### Positives

- **Less Complexity**: Easier to manage a single Ubuntu server than a multi-node cluster with advanced storage and networking.
- **Better Fit for Stateful Workloads**: A single Docker host avoids the overhead of distributed storage or volume replication.
- **Lower Resource Footprint**: Fewer components (like kube-apiserver, etcd, and controllers) means more resources for actual containers.
- **Aligned with Homelab Scale**: Running one node suits the small, localized nature of home automation services.
- **Additional learning opportunites**: Whilst I am familair with Ansible, I've never used Terraform before this project, so it is something else to learn.

### Potential Negatives

- **No Cluster Features**: We lose built-in HA or self-healing across multiple nodes, if we ever scale up.
- **Migration**: Replacing the old cluster and re-deploying containers under Terraform + Docker may require manual steps (e.g., data import, adjusting config).
- **Less Hands-On K8s**: Reduced opportunity for learning advanced Kubernetes features in the homelab environment.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge  
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge  
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge  
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge  
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge  
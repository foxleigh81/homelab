# Arctic ADR 001: Ansible, Docker, and Terraform

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![accepted]

## Context

After selecting the hardware for Arctic (see [ADR 000](./arctic-000.md)), we needed to decide on the software stack that would manage our machine. 

## Advice

1. **Use Docker for Containerization**  
   - Provides lightweight isolation for services like Nginx Proxy Manager and Pi-hole.  
   - Consistent across multiple servers, facilitating easy replication or scaling.

2. **Apply Terraform for Declarative Infrastructure**  
   - Resource definitions (`.tf` files) stored in Git, capturing Docker containers, volumes, and networks.  
   - Enforces a GitOps workflow: merges to `main` trigger `terraform plan` and `terraform apply`, ensuring consistent deployment.

3. **Employ Ansible for OS Configuration**  
   - Manages host-level tasks (installing Docker, updating packages, user management).  
   - Aligns with the same declarative principles as Terraform, but for system setup.

## Alternatives

1. **Windows + Docker Desktop**  
   - **Pros**: Spare license on hand; familiar GUI environment for some users, machine was pre-installed with it.  
   - **Cons**: Docker Desktop on Windows can introduce overhead, potential networking quirks, and less direct control of container runtime vs. native Linux, consumer versions of Windows do not feel as reliable as linux-based servers.

2. **Ubuntu Alone**  
   - **Pros**: Popular OS with straightforward `apt` package management.  
   - **Cons**: Would require separate manual processes or additional scripts to manage Docker containers and updates, unless layered with tools like Docker Compose.  

3. **Unraid**  
   - **Pros**: Already familiar with Unraid and have a spare licence for it.
   - **Cons**: Not managable via GitOps and provides no opportunites for learning. 

## Decision

**Run Arctic with a minimal Linux distribution** (Ubuntu Server) while employing **Docker** for containerization, **Terraform** for declarative infrastructure, and **Ansible** for host OS tasks. This unified, GitOps-driven approach ensures that all changes live in version control, providing consistent deployments across the homelab.

## Consequences

### Positives

- **Declarative GitOps Flow**  
  - Storing `.tf` and Ansible playbooks in Git allows automated pipelines (plan/apply for Terraform; host config via Ansible).
- **Lightweight + Flexible**  
  - Docker is well-supported on Linux, making container performance and network management straightforward.
- **Easier Collaboration & Auditing**  
  - All changes are proposed via pull requests, making it simple to review, revert, or audit configurations.
- **Future Expandability**  
  - If new containers or OS-level tasks arise, they slot into the existing Terraform/Ansible approach with minimal friction.

### Potential Negatives

- **Multiple Tools to Master**  
  - Requires familiarity with both Terraform (for containers) and Ansible (for OS tasks).
- **Learning Curve**  
  - For team members new to GitOps or Infrastructure as Code, there is an initial ramp-up.
- **Less UI-Driven**  
  - Compared to a Windows or fully GUI-based environment, the command-line approach demands a certain level of comfort and skill.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge  
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge  
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge  
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge  
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge  
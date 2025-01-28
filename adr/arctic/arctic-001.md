# ARCTIC ADR 001: Kubernetes

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![superceded] By [ADR 002](./arctic-002.md)

## Context

The Arctic server has been designated to run core home automation and related services. Initially, **Kubernetes** was selected as the primary orchestration platform, in part to **learn how to use Kubernetes** in a homelab environment. Its declarative approach, scalability, and alignment with GitOps practices made it an attractive option despite the relatively small-scale nature of the homelab.

## Advice

Kubernetes was chosen for its:

- **Declarative Management**: YAML-based definitions, ideal for GitOps workflows.
- **Scalability & Resilience**: Capable of handling additional nodes or more complex workloads if needed.
- **Learning Opportunity**: Serving as a hands-on sandbox to **gain experience** with Kubernetes, a skill valuable for larger production systems.
- **Rich Ecosystem**: Extensible through Helm charts and third-party operators.

## Alternatives

1. **Docker Compose**  
   - Pros: Simple, straightforward for a few containers.  
   - Cons: Less robust for advanced scaling, lacks built-in high availability.

2. **Standalone Docker**  
   - Pros: Minimal overhead, easy management on a single server.  
   - Cons: Manual approach for updates, missing advanced orchestration features.

3. **Other Container Orchestrators** (Nomad, Docker Swarm)  
   - Pros: Varying complexity levels.  
   - Cons: Smaller ecosystem or limited features compared to Kubernetes.

## Decision

**Create a new 'Arctic' cluster** to orchestrate home automation containers and future services, leveraging Kubernetes’ self-healing capabilities, declarative configuration, and serving as a platform to **learn** advanced container orchestration skills.

## Consequences

### Positives

- **Declarative & GitOps-Friendly**: Aligns well with a version-controlled, pipeline-driven configuration.
- **Skill-Building**: Provides a **hands-on environment** to gain valuable Kubernetes experience.
- **Scalable Architecture**: Potential to expand to multiple nodes if the homelab grows.
- **Powerful Ecosystem**: Access to tools like Helm, custom operators, and broad community support.

### Potential Negatives

- **Resource Overhead**: Kubernetes may be overkill for a simpler homelab running only a handful of containers.
- **Operational Complexity**: Managing clusters, networking, and add-ons (e.g., Ingress, MetalLB) is more involved than basic Docker setups.
- **Maintenance**: Requires cluster-level updates and monitoring beyond simple container restarts.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge  
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge  
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge  
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge  
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge  
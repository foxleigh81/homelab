# FENNEC ADR 002: Unraid Software Choice

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![accepted]

## Context

Fennec’s hardware was selected to consolidate two loud, power-hungry rack servers into a single, more efficient machine. After choosing consumer-grade components, I also had to decide which operating system/platform would manage storage and virtualization/container workloads. 

### Key Requirements

1. **Simplicity & Familiarity**  
   - Minimize learning curve and day-to-day administration tasks.
   - Prefer a user-friendly, web-based interface for quick management and monitoring.  
   
2. **Stability & Reliability**  
   - The server hosts critical workloads like media services, file shares, and Docker containers.  
   - Requires proven technology trusted by home server enthusiasts.  

3. **Existing License & Experience**  
   - Already owned an **Unraid license** from previous usage.
   - Significant hands-on familiarity, ensuring confident installation and fewer unknowns.

## Advice

- **Stick with Proven Tools**: Unraid is well-established in the home server community, known for its hybrid RAID approach, Docker integration, and easy plugin ecosystem.
- **Take Advantage of Existing License**: This saves costs and leverages prior knowledge to get started quickly.
- **Utilize Simple UI**: Unraid’s web-based dashboard lets you manage disk pools, Docker containers, and VMs without complex CLI steps.

## Alternatives

1. **Proxmox VE**  
   - **Pros**: Strong virtualization suite, ZFS support, robust community.  
   - **Cons**: More learning curve if unfamiliar, no direct Unraid-like array pooling.

2. **Plain Ubuntu / Debian + Docker**  
   - **Pros**: Maximum flexibility, no license needed, large community.  
   - **Cons**: Lacks the unified Unraid UI, more manual setup for storage & Docker.

3. **TrueNAS Scale**  
   - **Pros**: ZFS-based, Docker (Kubernetes) support, enterprise-like features.  
   - **Cons**: Newer product; not as simple for casual home server users.  

## Decision

**Install Unraid on Fennec**, leveraging the existing license and familiarity with its user-friendly approach to storage management, Docker integration, and plugins.

## Consequences

### Positives

- **Low Learning Curve**: Years of experience with Unraid plus an existing license means quick setup and minimal reconfiguration time.
- **Stable & Battle-Tested**: Unraid has a strong community and proven reliability for 24/7 operation, crucial for hosting important containers/services.
- **Easy Administration**: The web-based UI and plugin ecosystem enable straightforward disk pool management, Docker configuration, and monitoring.
- **Cost-Effective**: Reusing an owned license avoids additional software costs.
- **Maximises usable storage**: Unraid's parity system means that I only need to sacrifice a single 12TB drive as a parity drive. Rather than employ other RAID methods which would likely result in more storage loss (an acceptable risk as there is nothing mission-critical on this server).
- **Extensive community support**: Unraid has a massive library of plugins and pre-configured Docker containers which make setting up new services incredibly quick and simple.

### Potential Negatives

- **Less Granular Control**: As it is designed to be user-friendly, that can come with trade-offs to flexibility.
- **Proprietary RAID System**: Ties the server’s storage management to Unraid’s unique approach. Migration to another system will be cumbersome.
- **Community-Driven Plugins**: Reliance on unofficial/community plugins can sometimes pose compatibility or support challenges. If a container or plugin is not well-maintained, getting updates can be a pain.
- **Occasional unstable updates**: Whist rare these days, Unraid has been known to release updates that can affect the stability of an existing server. This can be mitigated easily by staying a few versions behind and always having a migration plan in place for updating to major releases.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge  
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge  
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge  
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge  
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge  
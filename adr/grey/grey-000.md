# GREY ADR 000: Hardware Choices

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![accepted]

## Context

Grey serves as a dedicated server for **ingress-based applications** (e.g., Nginx Proxy Manager, PiHole, etc...) that do not require the higher-performance hardware used by Fennec. 

### Budget Constraints

- Only **£100** was available to purchase the new hardware.
- High-end or brand-new consumer builds were out of scope, leading to the choice of used enterprise/consumer hardware.

### Reliability vs. Minimal Specs

- **Raspberry Pi** was briefly considered due to its low power draw and small form factor.
- However, ensuring reliability (with proper NVMe storage, stable power supplies, etc.) would approach or exceed the £100 budget.
- An x86 platform with enough CPU headroom to run Docker containers was more straightforward.

## Advice

- **Prioritize Cost-Effectiveness**:  
  Sourcing a used machine under £100 while ensuring it can handle basic Docker workloads for reverse proxy and minimal services.
- **x86 Compatibility**:  
  Simplifies software installation (e.g., native Docker images, no ARM-based building or Pi-specific tweaks).
- **Modest Resource Needs**:  
  The desired containers all have a small footprint. A basic 2- or 4-core CPU with 4–8 GB RAM is typically sufficient.

## Alternatives

1. **Raspberry Pi (ARM)**
   - **Pros**: Ultra low power, quiet, widely documented for homelab setups.
   - **Cons**: Additional hardware for reliability (SSD or NVMe HAT, stable power supply) drives up cost. ARM compatibility might require more Docker image consideration.

2. **Cloud Hosting for Ingress**
   - **Pros**: External hosting for reverse proxy, no local maintenance.
   - **Cons**: Potential latency, monthly costs, reliant on internet connectivity. Overkill for a simple homelab ingress solution.

3. **Reusing an existing Beelink Gemini T45/T34**
   - **Pros**: Already owned, consistent architecture.
   - **Cons**: Currently part of a 3 node Kubernetes cluster

4. **Used Dell Optiplex (Chosen)**
   - **Pros**: Inexpensive (<£100), x86 architecture, easily run Docker, reliable enough for 24/7 ingress duties.
   - **Cons**: Likely no expandability beyond a few drives/slots. Second-hand hardware can have hidden wear-and-tear.

## Decision

**Purchase a used Dell Optiplex** (2–4 cores, ~4–8 GB RAM) under **£100** to host ingress-based applications. This provides a stable x86 environment without exceeding the minimal budget, and avoids the complexity/cost of making a Raspberry Pi bulletproof for 24/7 Docker usage.

## Consequences

### Positives

- **Low Cost**: Fits the tight budget requirement.
- **x86 Reliability**: Straightforward Docker setup with native images and minimal configuration hassles.
- **Power Efficiency**: An older Optiplex typically runs at modest wattage, suitable for 24/7 operation.
- **Dedicated Ingress**: Frees up Arctic for heavier workloads while Grey handles all proxy responsibilities.

### Potential Negatives

- **Limited Expansion**: Small desktop form factor might restrict RAM or storage upgrades.
- **Used Hardware Risks**: Unknown lifespan, possibility of fan or drive failures if not carefully vetted.
- **Less Headroom for Growth**: If new services are added, Grey may need an upgrade to handle the load.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge  
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge  
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge  
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge  
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge  
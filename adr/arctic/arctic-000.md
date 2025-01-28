# ARCTIC ADR 000: Hardware choices

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![superceded] Partially superceded by [ADR 002](arctic-002.md) Only the Beelink T45 is used now.

## Context

The Arctic server is intended to host core smarthome services (e.g., Home Assistant, Zigbee2MQTT, etc.) in a Docker-based, GitOps-managed environment. The choice of hardware affects performance, power consumption, and future expandability. Documenting the hardware selection process ensures transparency and highlights the trade-offs considered for this critical component of the smarthome.

## Advice

Choose hardware that:
- Provides enough CPU and RAM headroom for Home Assistant, Zigbee2MQTT, and potential future containers (e.g., Node-RED, databases).
- Supports USB pass-through for the Zigbee coordinator.
- Has low to moderate power consumption, as it will likely run 24/7.
- Offers some room for expansion (additional storage, network upgrades).

## Alternatives

1. **Fennec (Unraid Server)**
   - Already running Unraid with other media-related containers.
   - Pros: Centralized management via Unraid UI, existing storage.
   - Cons: Resource contention with Frigate and other services. Additional hardware might be overkill or hamper performance for real-time workloads.

2. **Grey (Docker Portainer Host)**
   - Existing Docker host with Nginx Proxy Manager, Portainer.
   - Pros: Familiar environment, less overhead than Unraid.
   - Cons: Already tasked with proxy duties; may run out of CPU/RAM headroom if used for new core services. Potential conflicts with multiple critical containers on one box.

3. **A New Dedicated System (Arctic)**
   - Could be a small-form-factor PC, a mini server, or repurposed hardware specifically for home automation tasks.
   - Pros: Purpose-built for running Home Assistant, Zigbee2MQTT, and related containers without impacting other servers.
   - Cons: Initial hardware cost, additional maintenance overhead for a separate machine.

Ultimately, **the new, dedicated Arctic server** was selected. It provides isolation from other smarthome services, ensures reliable performance for home automation, and offers direct USB access for Zigbee devices without interfering with existing workloads on Fennec or Grey.

## Decision

We will deploy a new 3-node Kubernetes cluster to host the Arctic 'server'. It will be hosted on 3 Beelink machines.

- a Beelink SER5 PRO as the control plane (arctic-1)
- a Beelink Gemini T34 as a worker node (arctic-2)
- A beelink Gemini T45 as a worker node (arctic-3)

## Consequences

### Positives

- **Performance Isolation**: Arctic runs home automation tasks independently, avoiding contention with media or proxy services.
- **USB Pass-Through**: Easy direct access for Zigbee USB coordinator without complex pass-through setups on virtualized environments.
- **Scalability**: Additional containers (Node-RED, small databases, or new IoT services) can be added without impacting other servers.
- **Simplified Troubleshooting**: Home automation logs and workloads are on a dedicated machine, making it easier to diagnose issues.

### Potential Negatives

- **Increased Cost & Maintenance**: Another server means an upfront hardware purchase and the responsibility of updates, power, and potential hardware fixes.
- **Space & Cooling Requirements**: Additional physical footprint, and if it runs 24/7, it could slightly impact power bills and generate extra heat.
- **Separate Backup Strategy**: Need to implement dedicated backup routines for Arctic’s containers and data, rather than folding it into existing systems.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge
# FENNEC ADR 000: Hardware Choices

- **Date created**: 28/01/2025
- **Driver**: Alex Foxleigh (Foxy)

## Status

![accepted]

## Context

Fennec serves as a powerful, centralized Unraid server. At the time of its build, two primary factors guided the decision:

1. **Consolidation of Two Rack Servers**:  
   The existing enterprise rack servers were extremely loud, energy-intensive, and took up significant space. Rising electricity costs and noise levels made them impractical to keep running 24/7.

2. **Substantial Budget (£4k)**:  
   With a healthy budget, the priority was to find consumer-grade hardware that could provide **high performance** while significantly reducing both **power consumption** and **noise** compared to the old rack servers.

## Advice

- **Prioritize Low Power & Low Noise**:  
  Choose consumer-grade components (e.g., modern CPUs, efficient PSUs, large/quiet cooling) to keep the server as silent and power-efficient as possible.
- **Aim for Expandability**:  
  Ensure there’s room for additional drives, memory upgrades, or expansion cards over time (e.g., GPU transcoding, 10GbE NIC).
- **Ensure High Reliability**:  
  Since it replaces two enterprise servers, the hardware should support 24/7 operation, including quality motherboard, ECC memory (if possible), or other reliability measures.
- **Use existing hardware to save costs**
  The existing drives are old SAS drives but we could buy an inexpensive HBA and re-use the drives. We can also take the old 980ti out of storage for use as a transcoder and add the 2080ti as an AI accellerator when I replace my GPU in my gaming machine.

## Alternatives

1. **Retain Enterprise Rack Servers**
   - **Pros**: Already owned, enterprise-grade components.
   - **Cons**: Extremely loud, high power consumption, not sustainable given soaring electricity costs. 

2. **Cloud Hosting**
   - **Pros**: Offsite, no local hardware noise/heat, pay-as-you-go for resources.
   - **Cons**: Potentially expensive at scale, latency issues for local content, data ownership/sovereignty concerns.

3. **Consumer-Grade Custom Build (Fennec)**
   - **Pros**: Modern components, quieter fans, efficient CPU/PSU, significantly reduced noise and power usage. Large storage arrays for Unraid.
   - **Cons**: Upfront hardware costs (~£4k). Ongoing maintenance for a single server vs. hosted solution.

Ultimately, **a new consumer-grade build** was chosen for Fennec to **achieve maximum performance at a minimized noise/power ratio**, consolidating the functions of two obsolete rack servers.

## Decision

**Build an Unraid server (Fennec) with sufficient CPU cores, large RAM capacity, and quiet cooling solutions**, leveraging modern consumer-grade parts known for efficiency and expandability. This approach meets consolidation goals and reduces noise/electricity usage without sacrificing performance. Save costs by using existing GPUs.

Ultimately decided not to go with an HBA as PCI lanes are limited and my budget was high enough to afford a few new hard drives. I opted for a 10GB NIC instead of an HBA.

## Consequences

### Positives

- **Quiet Operation**: Eliminates the deafening noise of enterprise rack hardware, making the server room more tolerable.
- **Lower Electricity Bills**: Modern consumer-grade components significantly reduce power draw, mitigating rising electricity costs.
- **High Expandability**: Plenty of drive bays, memory slots, and GPU/PCIe expansion potential for future workloads.
- **Single Unified Server**: Functions previously split across two loud servers are now consolidated into a single, manageable Unraid machine.

### Potential Negatives

- **High Upfront Cost**: A £4k budget allowed for robust hardware, but it’s a large initial investment.
- **Still Requires Maintenance**: Even a quiet, efficient machine needs ongoing upkeep, updates, and potential hardware fixes.
- **Less “Enterprise” Features**: While consumer parts are reliable, some enterprise-grade redundancy (like dual PSUs or advanced hardware RAID controllers) will be lost.

[proposed]: https://img.shields.io/badge/Proposed-yellow?style=for-the-badge
[accepted]: https://img.shields.io/badge/Accepted-green?style=for-the-badge
[superceded]: https://img.shields.io/badge/Superceded-orange?style=for-the-badge
[rejected]: https://img.shields.io/badge/Rejected-red?style=for-the-badge
[deprecated]: https://img.shields.io/badge/Deprecated-grey?style=for-the-badge
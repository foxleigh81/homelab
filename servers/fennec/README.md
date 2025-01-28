# Fennec

This is my workhorse machine, it's basically a gaming PC with loads of storage.
It runs on Unraid and runs a ton of docker services. It's primarily my media centre PC but I also use it for streaming
older steam games across my network as well as using it as my AI-assisted CCTV server.

It's got a ton of storage so it's also my main on-site backup machine for my various computers and my other servers.

At the moment, nothing from Fennec is in the repo as it's not managed via GitOps. It's unlikely to be re-architected 
any time soon as I'm pretty happy with the setup, although I will probably move a few individual app configs (such as Frigate) into 
here at some point.

## Services

- Various media centre services
- Tautulli
- Frigate
- Scrypted
- Deepstack
- Double-take
- Headless Steam
- Timemachine
- VS Code (For editing local config files)
- Binhex crusader (For panel based file management)
- and a few game servers (Valheim, Project Zomboid, etc...)

## Specs

- 12th Gen Intel Core-i7-12700 @ 2079 Mhz (20 cores)
- 64GB DDR5 Memory
- An Nvidia 2080ti (For gaming and for AI stuff)
- An Nvidia 980ti (No Tensor cores so I just use it for transcoding)
- 10gig NIC
- 40Tb of usable storage
- 12Tb of parity storage
- 7Tb of SSD's (mix of reguar SSD's and NVMe's) for Cache operations
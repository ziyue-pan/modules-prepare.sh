# modules-prepare.sh

This tiny script helps you generate kernel development headers with ease. It detects generated utsrelease version and run `modules_prepare` target with the same configuration and source code.

## Quick Start

Put `prepare.sh` under linux source code directory:

```bash
wget https://raw.githubusercontent.com/PAN-Ziyue/modules-prepare.sh/main/prepare.sh && chmod +x prepare.sh
```

Create configuration

```bash
make defconfig
```

Excute `prepare.sh` with parameters:

```bash
./prepare.sh -j$(nproc)
```

Results:

```bash
$ ls linux-headers-x.x.x
arch   COPYING  Documentation  fs       ipc      kernel    MAINTAINERS  Module.symvers  samples   sound  virt
block  CREDITS  drivers        include  Kbuild   lib       Makefile     net             scripts   tools
certs  crypto   firmware       init     Kconfig  LICENSES  mm           README          security  usr
```

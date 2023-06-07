0. Back up Important data

1. Plug in an usb, find out usb drive path

```shell
sudo fdisk -l
```

> ...  
Disk /dev/sda: 14.66 GiB, 15728640000 bytes, 30720000 sectors
Disk model: CoolFlash       
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x405a23c7  
...
2. burn iso file to usb

```shell
# Burn Ubuntu20.04 Desktop to /dev/sda
./burn_iso.sh /dev/sda
# Burn Ubuntu22.04 Server to /dev/sda
./burn_iso.sh -s -v jammy /dev/sda
```
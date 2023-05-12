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
2. find the usb drive path and run below command, replace USB_PATH with your own usb path.

```shell
export USB_PATH=/dev/sda
```

#### 2.burn iso file to usb

```shell
./burn_iso.sh 
```
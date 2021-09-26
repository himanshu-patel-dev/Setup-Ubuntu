# Problems in Ubuntu 20.04

## Random problems in HDD and bad sectors.

Application stops opening and restart show initframes screen.

```bash
# see the partitions
~ : blkid
/dev/sda4: UUID="79571726-ec70-44c7-ab26-a745e26302fc" TYPE="ext4" PTTYPE="dos" PARTUUID="1ff8017e-04"
/dev/sda1: LABEL="System Reserved" UUID="BC88E1E788E1A05E" TYPE="ntfs" PARTUUID="1ff8017e-01"
/dev/sda2: UUID="26B0E546B0E51D55" TYPE="ntfs" PARTUUID="1ff8017e-02"
/dev/sda3: LABEL="New Volume" UUID="A4F69A60F69A3312" TYPE="ntfs" PARTUUID="1ff8017e-03"

# choose the ext4 partition as that is the one belongs to ubuntu and rest belong to windows
# clean that partition using fsck tool

fsck /dev/sda4 -y

# reboot the system and enjoy
```

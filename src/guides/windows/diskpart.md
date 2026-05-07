# Diskpart

Open a terminal with admin rights.

```bash
diskpart
```

## Virtual disks

Create a new virtual disk:

```txt
create vdisk file=<|filepath_here.vhdx|> type=<|fixed | expandable|> maximum=<|size in MB|>
```

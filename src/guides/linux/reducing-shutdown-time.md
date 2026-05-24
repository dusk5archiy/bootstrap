# Reducing Shutdown Time

Run:

```bash
sudo apt install vim
sudo vim /etc/systemd/system.conf
```

Find a line containing `#DefaultTimeoutsStopSec=90s` and replace it with
`DefaultTimeoutsStopSec=5s` (remove the `#` sign).

Finally, run this to apply the changes:

```bash
sudo systemctl daemon-reload
```

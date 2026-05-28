#!/bin/bash

timedatectl set-local-rtc 1 --adjust-system-clock

## To verify:
# timedatectl
## RTC in local TZ: yes

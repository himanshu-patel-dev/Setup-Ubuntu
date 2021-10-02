# Ubuntu Settings Chagnes

## Set system to pick time from RTC and not UTC to maitain time between windows and Ubuntu same

```bash
timedatectl set-local-rtc 1
```

```bash
himanshu@workstation:~$ timedatectl
               Local time: Sat 2021-09-25 17:54:27 IST
           Universal time: Sat 2021-09-25 12:24:27 UTC
                 RTC time: Sat 2021-09-25 12:24:27    
                Time zone: Asia/Kolkata (IST, +0530)  
System clock synchronized: yes                        
              NTP service: active                     
          RTC in local TZ: no                         
himanshu@workstation:~$ timedatectl set-local-rtc 1
himanshu@workstation:~$ 
himanshu@workstation:~$ timedatectl
               Local time: Sat 2021-09-25 18:32:55 IST
           Universal time: Sat 2021-09-25 13:02:55 UTC
                 RTC time: Sat 2021-09-25 18:32:54    
                Time zone: Asia/Kolkata (IST, +0530)  
System clock synchronized: yes                        
              NTP service: active                     
          RTC in local TZ: yes                        

Warning: The system is configured to read the RTC time in the local time zone.
         This mode cannot be fully supported. It will create various problems
         with time zone changes and daylight saving time adjustments. The RTC
         time is never updated, it relies on external facilities to maintain it.
         If at all possible, use RTC in UTC by calling
         'timedatectl set-local-rtc 0'.
```

# speed-test.sh

Internet speed-test from the terminal with logging enabled by default, ``speedtest.sh`` enables you to log your ping, upload and downloads stats over time.
 
```Javascript
┌──(user㉿user)-[~]
└─$ bash speedtest.sh
----------------------------------------------------------------------
Starting speedtest.sh at 15:04:26 on Thursday 2021-09-23
 ISP           : MTN NIGERIA Communication limited
 Location      : Lagos / NG
 Region        : Lagos
 IP Address    : 127.0.0.1
 Timezone      : Africa/Lagos
 
Ping: 65.652 ms
Download: 4.13 Mbit/s
Upload: 0.14 Mbit/s
----------------------------------------------------------------------
```
speedtest.sh logs the results to speedtest-log

```Javascript
┌──(user㉿user)-[~]
└─$ cat speedtest-log
----------------------------------------------------------------------
Starting speedtest.sh at 15:04:26 on Thursday 2021-09-23
 ISP           : MTN NIGERIA Communication limited
 Location      : Lagos / NG
 Region        : Lagos
 IP Address    : 197.210.78.124
 Timezone      : Africa/Lagos
Ping: 65.652 ms
Download: 4.13 Mbit/s
Upload: 0.14 Mbit/s
----------------------------------------------------------------------

----------------------------------------------------------------------
Starting speedtest.sh at 19:13:47 on Friday 2021-09-23
 ISP           : MTN NIGERIA Communication limited
 Location      : Lagos / NG                                                                                                                                
 Region        : Lagos                                                                                                                                     
 IP Address    : 127.0.0.1                                                                                                                            
 Timezone      : Africa/Lagos                                                                                                                              
Ping: 56.779 ms                                                                                                                                            
Download: 47.13 Mbit/s
Upload: 3.82 Mbit/s
----------------------------------------------------------------------

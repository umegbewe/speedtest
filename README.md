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
```
## Add speedtest.sh to Cron Job

Create crontab file with:
```
crontab -e
```
then select which editor you're comfortable with

```Javascript
┌──(user㉿user)-[~]
└─$ crontab -e 
no crontab for user - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny
  4. /usr/bin/code

Choose 1-4 [1]: 1
```
add to the crontab file and save
```Shell
0 6 * * * ~/speed-test/speedtest.sh
```
this would run speedtest.sh every day at 6am

please refer to https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/ to learn more about cron jobs

## Thanks
Thanks to [sivel](https://github.com/sivel) his project [speedtest-cli](https://github.com/sivel/speedtest-cli) made this possible. Found this useful? Star the repo and follow me on [Twitter](https://twitter.com/nwebedu_junior). Thanks :heart:

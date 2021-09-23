#!/bin/bash

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREENS="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

mem=$( mktemp /tmp/speedtest.XXXXXXXX )

speedtest='https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py'

curl --silent $speedtest > $mem

chmod 755 $mem

Time=$(date "+%H:%M:%S on %A %Y-%m-%d")

logfile="speedtest-log"


deletetmp() {
    rm -f $mem
}



ip_info() {
    local isp="$(wget -q -O- ipinfo.io/org)"
    local city="$(wget -q -O- ipinfo.io/city)"
    local country="$(wget -q -O- ipinfo.io/country)"
    local region="$(wget -q -O- ipinfo.io/region)"
    local ipaddr="$(wget -q -O- ipinfo.io/ip)"
    local timez="$(wget -q -O- ipinfo.io/timezone)"
    
 printf "%-70s\n" "-" | sed 's/\s/-/g'
 
    echo 'Starting speedtest.sh at' $Time
    
    echo ${WHITE}" ISP           : ${ORANGE}"$isp""
    echo ${WHITE}" Location      : ${ORANGE}"$city / $country""
    echo ${WHITE}" Region        : ${ORANGE}"$region""
    echo ${WHITE}" IP Address    : ${ORANGE}"$ipaddr""
    echo ${WHITE}" Timezone      : ${ORANGE}"$timez""; reset_color
    $mem --simple
 printf "%-70s\n" "-" | sed 's/\s/-/g'    
}

logging() {
    if [[ $@ == --log ]]; then
    ip_info >> $logfile 
    else
    echo "Unknown Parameter"
    fi
}

ip_info 
logging --log
deletetmp

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

ip_info() {
    local org="$(wget -q -O- ipinfo.io/org)"
    local city="$(wget -q -O- ipinfo.io/city)"
    local country="$(wget -q -O- ipinfo.io/country)"
    local region="$(wget -q -O- ipinfo.io/region)"
    [[ -n "$org" ]] && echo " Network          : ${BLUE}( "$org")"
    [[ -n "$city" && -n "country" ]] && echo ${WHITE}" Location              : ${BLUE}( "$city / $country")"
    [[ -n "$region" ]] && echo ${WHITE}" Region                : ${BLUE}( "$region")"
}

system_info() {
    cpu=$( sed -n '5p' /proc/cpuinfo | cut -d " " -f 3-60 )  ## model name
    os=$( sed -ne '/PRETTY_NAME/p' /etc/os-release | sed 's/PRETTY_NAME=//' | tr -d '"' ) ## os
    kern=$( uname -r ) ## kernel
    upt=$( uptime -p | cut -d " " -f2- ) ##uptime
    echo ${WHITE}"---------------------------------------------------------------------------"
    echo ${WHITE}"                                  SYSTEM                         "
    echo ""
    echo " CPU Model             : $cpu"
    echo " OS                    : $os"
    echo " Kernel                : $kern"
    echo " Uptime                : $upt"
    echo ${WHITE}"---------------------------------------------------------------------------"




}

ip_info
system_info
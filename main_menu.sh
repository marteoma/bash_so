#!/usr/bin/env bash

. ./general_menu.sh --source-only
. ./file_menu.sh --source-only
. ./user_menu.sh --source-only

# Color variables
#    .----------
#    vvvv vvvv--
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

print_center(){
    local x
    local y
    text="$*"
    x=$(( ($(tput cols) - ${#text}) / 2))
    echo -ne "\E[6n";read -sdR y; y=$(echo -ne "${y#*[}" | cut -d';' -f1)
    echo -ne "\033[${y};${x}f$*"
}

function end() {
  echo -e "Adiós\n"
  exit
}
function main() {
  function main_menu() {
    echo -e "${RED}"
    print_center "Menú Principal\n"
    echo -e "${NC}"
    print_center "1. COMANDOS GENERALES\n"
    print_center "2. USUARIOS\n"
    print_center "3. SISTEMA DE ARCHIVOS\n"
    print_center "9. TERMINAR\n"
    echo -e "${RED}"
    print_center "Seleccione la opción deseada __\n"
    echo -e "${NC}"
  }

  main_menu
  read -n 1
  echo -e "${BLUE}\n"

  clear
  case $REPLY in
  1 )
    general
    ;;
  2 )
    users
    ;;
  3 )
    files
    ;;
  9 )
    end
    ;;
  * )
    print_center "Invalide choice"
    main
    ;;
  esac
}
main

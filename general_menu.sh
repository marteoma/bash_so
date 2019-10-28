function waitgen() {
  echo -e "Press any key to continue\n"
  read -n 1
  clear
  general
}

function mytime() {
  date | cut -c 12-20
}

function path() {
  pwd
}

function password() {
  passwd
}

function fdisk() {
  df -h --output=source,size,avail
}

function udisk() {
  df -h --output=source,size,used
}

function myps() {
  ps
}

function back() {
  main
}

function general() {

  function general_menu() {
    echo -e "${NC}"
    print_center "1. VISUALIZAR HORA DEL SISTEMA\n"
    print_center "2. PATH O RUTA ACTUAL\n"
    print_center "3. CAMBIO DE PASSWORD\n"
    print_center "4. MOSTRAR DISCO LIBRE\n"
    print_center "5. MOSTRAR DISCO UTILIZADO\n"
    print_center "6. VISUALIZAR PROCESOS ACTIVOS\n"
    print_center "9. REGRESAR\n"
    echo -e "${RED}"
    print_center "Seleccione la opción deseada __\n"
    echo -e "${NC}"
  }
  echo -e "${RED}"
  print_center "Menú de comandos generales\n"
  echo -e "${NC}"
  general_menu

  read -n 1
  echo -e "${BLUE}\n"
  clear

  case $REPLY in
  1)
    mytime
    waitgen
    ;;
  2)
    path
    waitgen
    ;;
  3)
    password
    waitgen
    ;;
  4)
    fdisk
    waitgen
    ;;
  5)
    udisk
    waitgen
    ;;
  6)
    myps
    waitgen
    ;;
  9)
    back
    ;;
  *)
    echo "Invalide choice"
    general
    ;;
  esac
}

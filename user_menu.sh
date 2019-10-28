function waitusr() {
  echo -e "Press any key to continue\n"
  read -n 1
  clear
  users
}

function conn() {
  who
}

function countconn() {
  who -q | tail -n +2
}

function isconnected() {
  echo -e "Digite el nombre del usuario\n"
  read
  if [[ $(who | grep ${REPLY}) ]]; then
    echo "The user is connected"
  else
    echo "The user is not connected"
  fi
}

function sendmsg() {
  echo -e "Digite el mensaje al usuario\n"
  read
  echo $REPLY > temp_msg
  echo -e "Digite el nombre del usuario\n"
  read
  cat temp_msg | write $REPLY
}

function users() {

  function users_menu() {
    echo -e "${NC}"
    print_center "1. MOSTRAR NOMBRE DE USUARIOS CONECTADOS\n"
    print_center "2. MOSTRAR NUMERO DE USUARIOS CONECTADOS\n"
    print_center "3. AVERIGUAR SI UN USUARIO ESTA CONECTADO\n"
    print_center "4. ENVIAR MENSAJE A UN USUARIO\n"
    print_center "9. REGRESAR\n"
    echo -e "${RED}"
    print_center "Seleccione la opción deseada __\n"
    echo -e "${NC}"
  }

  echo -e "${RED}"
  print_center "Menú de usuarios\n"
  echo -e "${NC}"

  users_menu
  read -n 1
  clear
  echo -e "${BLUE}"

  case $REPLY in
  1)
    conn
    waitusr
    ;;
  2)
    countconn
    waitusr
    ;;
  3)
    isconnected
    waitusr
    ;;
  4)
    sendmsg
    waitusr
    ;;
  9)
    back
    ;;
  *)
    echo "Invalide choice"
    users
    ;;
  esac

}


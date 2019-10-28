function waitfile() {
  echo -e "Press any key to continue\n"
  read -n 1
  clear
  files
}

function createdir() {
  echo -e "Digite el nombre del directorio\n"
  read
  if test -e ${REPLY}; then
    echo "Un directorio o archivo ya existe con ese nombre"
  else
    mkdir ${REPLY}
  fi
}

function copyfile() {
  echo -e "Digite la dirección del archivo a copiar\n"
  read origin
  if test -f ${origin}; then
    echo -e "Digite la dirección del destino\n"
    read destination
    cp ${origin} ${destination} || echo -e "No tien permiso para realizar esta operación\n"
  else
    echo -e "El archivo no existe"
  fi
}

function modperm() {
  echo -e "Digite la dirección del directorio o archivo a modificar\n"
  read origin
  if test -e ${origin}; then
    echo -e "Digite los nuevos permisos"
    read perm
    chmod $perm $origin
  else
    echo -e "El archivo no existe"
  fi
}

function readfile() {
  echo -e "Digite la dirección del archivo a leer\n"
  read origin
  if test -f ${origin}; then
    more $origin
  else
    echo -e "El archivo no existe"
  fi
}

function delfile() {
  echo -e "Digite la dirección del archivo a eliminar\n"
  read origin
  if test -f ${origin}; then
    rm $origin
  else
    echo -e "El archivo no existe"
  fi
}

function changename() {
  echo -e "Digite la dirección del archivo a cambiar\n"
  read origin
  if test -e ${origin}; then
    echo -e "Digite el nuevo nombre\n"
    read name
    if test -e ${name}; then
      echo -e "Ya existe un archivo con ese nombre"
    fi
  else
    echo -e "El archivo no existe"
  fi
}

function deldir() {
  echo -e "Digite la dirección del directorio a eliminar\n"
  read origin
  if test -d ${origin}; then
    rm -R $origin
  else
    echo -e "El archivo no existe"
  fi
}

function files() {

  function files_menu() {
    echo -e "${NC}"
    print_center "1. CREAR DIRECTORIO\n"
    print_center "2. COPIAR ARCHIVOS\n"
    print_center "3. MODIFICAR PERMISOS A UN ARCHIVO\n"
    print_center "4. VISUALIZAR EL CONTENIDO DE UN ARCHIVO\n"
    print_center "5. BORRAR UN ARCHIVO\n"
    print_center "6. CAMBIAR EL NOMBRE DE UN ARCHIVO\n"
    print_center "7. BORRAR DIRECTORIO\n"
    print_center "9. REGRESAR\n"
    echo -e "${RED}"
    print_center "Seleccione la opcion deseada __\n"
    echo -e "${NC}"
  }

  echo -e "${RED}"
  print_center "Menu de archivos\n"
  echo -e "${NC}"

  files_menu
  read -n 1
  clear
  echo -e "${BLUE}"

  case $REPLY in
  1)
    createdir
    waitfile
    ;;
  2)
    copyfile
    waitfile
    ;;
  3)
    modperm
    waitfile
    ;;
  4)
    readfile
    clear
    files
    ;;
  5)
    delfile
    waitfile
    ;;
  6)
    changename
    waitfile
    ;;
  7)
    deldir
    waitfile
    ;;
  9)
    back
    ;;
  *)
    echo -e "Invalide choice\n"
    files
    ;;
  esac
}

requires() {
  command -v "${1}" &> /dev/null || err "baste requires '${1}'; exiting ..."
}
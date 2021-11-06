validate_valid_uuid() {
  [[ "${1}" =~ ^[a-zA-Z0-9]{32}$ ]] || echo -e "$(red_bold [ERR]) UUID must be a 32-character long alphanumeric string; exiting ..."
}
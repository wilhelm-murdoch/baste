err() {
  echo -e "$(red_bold [ERR]) ${1}" >&2
  exit 1
}
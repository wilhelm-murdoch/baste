requires curl
requires git
requires jq

if [[ "${OSTYPE}" == "darwin"* ]]; then
  requires pbpaste
else
  requires xclip
fi

: "${GITHUB_TOKEN:=}"
if [[ "${args[--token]}" ]]; then               # First, --token flag takes precedence.
  token="${args[--token]}"
elif [[ "${GITHUB_TOKEN}" ]]; then              # Next, we try an environmental variable.
  token="${GITHUB_TOKEN}"
elif git config github.token &> /dev/null; then # finally, we fall back to any possible git config.
  token=$(git config github.token)
else
  err 'you must specifiy a valid token before posting; exiting ...'
fi

content="${args[--content]}"
if [[ "${args[--file]}" ]]; then
  if ! test -f "${args[--file]}"; then
    err "file ${args[--file]} does not exist; exiting ..."
  fi
  content=$(<"${args[--file]}")
 elif [[ "${args[--clipboard]}" ]]; then
  [[ "${OSTYPE}" == "darwin"* ]] && content=$(pbpaste) || content=$(xclip -o -selection clipboard)
fi

if read -t 0; then
  read -r content
fi

[[ ! "${content}" ]] && err 'you must provide some kind of content to post; exiting ...'

[[ "${args[--public]}" ]] && public="true" || public="false"

payload=$(
  jq -n \
    --arg     description "${args[--description]}" \
    --arg     name        "${args[--name]}"        \
    --arg     extension   "${args[--extension]}"   \
    --arg     content     "${content}"             \
    --argjson public      ${public}                \
    '{
      description: $description, 
      public: $public,
      files: {
        "\($name).\($extension)": {
          content: $content
        }
      }
    }'
)

response=$(
  curl -s -X POST https://api.github.com/gists \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${token}" \
  -d "${payload}"
)

url=$(echo "${response}" | jq -r '.html_url')
[[ "${url}" == 'null' ]] && err "$(echo "${response}" | jq -r '.message' | tr -d '\n\t')"

if [[ "${args[--skip-short-url]}" ]]; then
  echo "${url}"
  exit 0
fi

curl -is https://git.io -F "url=${url}" | awk -v FS=": " '/^Location/{print $2}'

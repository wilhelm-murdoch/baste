requires curl
requires git
requires jq

token="${GITHUB_TOKEN}"
if [[ ! "${GITHUB_TOKEN}" ]]; then
  token="${args[token]}"
fi

if [[ ! "${token}" ]]; then
  token=$(git config github.token)
fi

if [[ ! "${token}" ]]; then
  err 'you must specifiy a valid token by defining a GITHUB_TOKEN env, using the --token flag or setting it in your global git config.'
fi

payload=$(
  jq -n \
    --arg description "description" \
    --arg name        "${args[--name]}"   \
    --arg extension   "${args[--extension]}" \
    --arg content     "derp"        \
    --arg public      "true"       \
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

curl -s -X POST https://api.github.com/gists \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${token}" \
  ${CURL_OPTS} \
  -d "${payload}" | jq -r '.html_url'

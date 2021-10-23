# baste

`baste` is a paste bin tool written in Bash for quickly creating Gists.

## Requirements

Before you begin using `baste`, you will need the following installed on your machine:

1. A personal development token which can be sourced [here](https://github.com/settings/tokens).
2. `curl`
3. `git`
4. `jq`
5. `xclip` if you're using Linux. If you're using MacOS, `baste` will use `pbpaste` which is included by default.

## Installation

The command is completely self-contained in a single Bash script. Drop it in your system's `$PATH` and you're good to go. In the following example, we're saving it directly to `/usr/local/bin/baste`:

```bash
$ curl -s https://git.io/JiqBi > /usr/local/bin/baste
$ chmod a+x /usr/local/bin/baste 
$ baste --help
baste - A paste bin tool written in Bash for quickly creating Gists.

Usage:
  baste [options]
  baste --help | -h
  baste --version | -v

Options:
  --help, -h
    Show this help

  --version, -v
    Show version number

  --description, -d DESCRIPTION
    A brief description of your Gist.

  --name, -n NAME
    The file name of your Gist.
    Default: gistfile1

  --content, -c CONTENT
    The content of your Gist.

  --public, -p
    Determines whether your Gist will be public or private.

  --clipboard, --clip
    Attempts to use the latest entry in your local clipboard as content for your
    Gist. If using MacOS, an attempt to use pbpaste will be made. Otherwise,
    xclip will be used.

  --skip-short-url
    Resulting Gist URLs are shortened by default using git.io. This flag will
    skip this entirely and provide the full URL.

  --file, -f FILE
    A path to the file to upload to Gist.

  --extension, -e EXTENSION
    The file extension of the Gist. 
    Default: txt

  --token, -t TOKEN
    Explicitly specific a personal developer token as an alternative to using
    the GITHUB_TOKEN environmental variable.

Environment Variables:
  GITHUB_TOKEN
    A personal developer token associated with your Github account. You can
    easily create a new one in the "Developer Settings" page under your
    account settings. The only permission scope you will need is "gist" in
    order to create new Gists.

Examples:
  base --file /path/to/file.txt
  baste --content '... code ...'
  baste --name 'README.md' --content '# My Readme' --public
  cat /path/to/file | baste
  baste --clipboard
```
    
## Building & Contributing

This tool is written in Bash, but built with [Bashly](https://bashly.dannyb.co/). Perform the following steps to begin developing locally:

1. Install Bashly locally with `gem install bashly`.
2. Clone this repository with `git@github.com:wilhelm-murdoch/baste.git`.
3. Modify the tool's command configuration in `src/bashly.yml`.
4. Run `bashly g` from the root of this project to stub out any new commands or update any help documentation.
5. Start coding your new command from the stubbed Bash script in `src/*_command.sh`.
6. Run `bashly g` every time you wish to test your progress as Bashly consolidates all changes to the `dq` script located at the root of this project.

Contributions are always welcome. Just create a PR and remember to be nice.

## Acknowledgements

This stupid little tool couldn't be possible without the following projects:

 - [Bashly](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)
 - [readme.so](https://readme.so/)

## License

[Unlicense](https://choosealicense.com/licenses/unlicense/)

  

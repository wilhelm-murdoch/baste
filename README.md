# baste

A paste bin tool written in Bash.

## Requirements

Before you begin using `baste`, you will need the following installed on your machine:

1. `curl`
2. `git`
3. `jq`
4. `xclip` if you're using Linux.

## Installation

The command is completely self-contained in a single Bash script. Drop it in your system's `$PATH` and you're good to go. In the following example, we're saving it directly to `/usr/local/bin/baste`:

```bash
$ curl -s https://git.io/JiqBi > /usr/local/bin/baste
$ chmod a+x /usr/local/bin/baste 
$ baste --help

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

  
## What it is?
- This is a collection of scripts that are usefull **for me**. You also may find something usefull.
- This works on my machine, but may not work on yours because of enviroment variables, dependencies, etc.
- Understanding how `gum` works before changing anything is advisable.
- Some scripts were made to be used with shell commands (like `run | xclip -sel clip`)
- **Fork this repo**. Don't use it directly because it may break your stuff in the future.

## How it works?
It uses `gum` to show a list of scripts in a preconfigured directory. It's just a handy way to have global access to them.
`run.sh` is the script that call all others. It's very short and easy to understand. 
## Setup
- Create a scripts directory anywhere
- Add it as a enviroment variable: `SCRIPTS_DIR="full/path/to/scripts/dir"`
- Create an alias: `alias run="$SCRIPTS_DIR/run.sh"`

## Scripts Examples
This list is not complete. It just shows some examples.
- `compress-video.sh`: compress a video
- `downgrade-package.sh`: downgrade an arch package
- `lua-init.sh`: initialize a basic lua project (more information in the source file)
- `symlink-godot.sh`: switch between godot versions
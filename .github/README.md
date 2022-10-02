These dotfiles and installation scripts are meant to be cloned in the home directory for quick setup of a new machine and the ability to synchronize configuration. There is some macOS-specific configuration, but this can also be used in Linux environments (just ignore the installation scripts).

The repository uses an inverse `.gitignore` where each file included must be explicitly listed, so nothing will be accidentally added.

-----

## Usage

### Adding the repository to a new system
    git init
    git remote add origin git@github.com:greyshi/dotfiles.git

    # Warning: The following command will override everything in the home directory that is included in the repository. This is meant to run on a fresh install, so this shouldn't be an issue.
    git switch -f $BRANCH

### Installation scripts
`.macos`: Customizes macOS settings to my preferences. It's based on the one [here](https://github.com/mathiasbynens/dotfiles).

`.brew.sh`: Installs various tools and fonts using [homebrew](https://brew.sh/).
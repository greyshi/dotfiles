# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# macOS specific configuration
if [[ $OSTYPE == 'darwin'* ]]; then
    # Pure theme
    fpath+=("$(brew --prefix)/share/zsh/site-functions")
    autoload -U promptinit; promptinit
    prompt pure
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

DISABLE_UPDATE_PROMPT=true
COMPLETION_WAITING_DOTS="true"
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# User configuration
export LESS='-FRiS#3NM~g'

source ~/.aliases

# Load work configurations if they exist
test -f ~/.work.zsh && source ~/.work.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

. "$HOME/.local/bin/env"


export CLAUDE_CODE_USE_BEDROCK=1
#export ANTHROPIC_MODEL='us.anthropic.claude-3-7-sonnet-20250219-v1:0'
export ANTHROPIC_MODEL='us.anthropic.claude-sonnet-4-20250514-v1:0'
#export ANTHROPIC_MODEL='us.anthropic.claude-opus-4-20250514-v1:0'

export DISABLE_PROMPT_CACHING=0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

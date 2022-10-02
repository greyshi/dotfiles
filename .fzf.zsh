# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"


#### User Customization ####

fzf_default_opts=(
  "--layout=reverse"
  "--info=inline"
  "--height=60%"
  "--color hl:#c9a8fa,hl+:#ff92d0,pointer:#f3f89d"
)
export FZF_DEFAULT_OPTS="${fzf_default_opts[*]}"

# Makes fzf respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude .git"

# Remap fzf key bindings
bindkey -r '^T'
bindkey '^Q' fzf-file-widget

bindkey -r '\ec'
bindkey '^x' fzf-cd-widget


fzf-history() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore --tiebreak=index --expect=ctrl-v $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  local key="${selected[1]}"
  local cmd="${selected[2]}"

  if [[ "$cmd" ]]; then
      #LBUFFER="$cmd"
      # Executes the command on selection unless the hotkey is pressed
      if [[ "$key" != "ctrl-v" ]]; then
          zle accept-line
      else
          zle vi-fetch-history -n $cmd
      fi
  fi

  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}

zle -N fzf-history
bindkey "^R" fzf-history

# Make history search execute after selection
#bindkey "$(bind -s | grep '^"\\C-r"' | grep -v '\\C-m' | sed 's/"$/\\C-m"/')"

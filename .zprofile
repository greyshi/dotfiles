if [[ $OSTYPE == 'darwin'* ]]; then
    # Set PATH, MANPATH, etc., for Homebrew if on mac
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi


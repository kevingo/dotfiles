
if [ "`uname -s`" == "Linux" ]; then
    alias ls="/bin/ls -aF --color=always"
    alias tmux="TERM=screen-256color /usr/bin/tmux"
else
    alias ls="/bin/ls -aF"
fi

# support https://github.com/creationix/nvm
if [ -f "${HOME}/.nvm/nvm.sh" ]; then
    export NVM_DIR=$HOME/.nvm
    source ${HOME}/.nvm/nvm.sh > /dev/null 2>&1
    nvm use stable > /dev/null 2>&1
fi

# init z! (https://github.com/rupa/z)
[ -f "${HOME}/z.sh" ] && source ${HOME}/z.sh

# add bin folder to $PATH.
if [ -d "${HOME}/bin" ]; then
    export PATH=$PATH:${HOME}/bin
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file" > /dev/null 2>&1;
done;

unset file;

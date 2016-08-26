# vim as default
export EDITOR="vim"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# brew cask default appdir
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


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
for file in ~/.{path,bash_prompt,exports,alias,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file" > /dev/null 2>&1;
done;

unset file;

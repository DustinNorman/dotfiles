export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/usr/local/bin:$PATH

# Make Sublime Text the default editor
# -w means to wait
export EDITOR='subl -w'

# Aliases
alias cd..='cd ..'
alias ls='/bin/ls -labFkGph'

# Forces the bash history to be written to .bash_history without have to logout
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Load bash completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load Homeshick and it's bash completions
if [ -f "$HOME/.homesick/repos/homeshick/homeshick.sh" ]; then
	source "$HOME/.homesick/repos/homeshick/homeshick.sh"

	# Refresh
	homeshick --quiet refresh 1
fi
if [ -f "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash" ]; then
	source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
export PS1='\n\[\e[1;37m\]|-- \[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\] \[\e[1;37m\]--|\[\e[0;39m\]\n$ '

# Local (non-homeshicked) bashrc
[[ -f "$HOME/.bashrc_local" ]] && source "$HOME/.bashrc_local"

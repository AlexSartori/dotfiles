# Set XDG variables
set -x -g XDG_DATA_HOME $HOME/.local/share
set -x -g XDG_CONFIG_HOME $HOME/.config
set -x -g XDG_STATE_HOME $HOME/.local/state
set -x -g XDG_CACHE_HOME $HOME/.cache

# if [ -t 0 ]
	# Activate powerline
	source /usr/share/powerline/fish/powerline-setup.fish
	powerline-setup
# end

# Print logo
set fish_greeting # Suppress default greeting
fish_logo cyan blue white

# Aliases
alias cat=lolcat
alias dusg="du -sh * | sort -hr"
alias dl=cd /home/alex/Downloads
alias iten="trans -s it -t en"
alias enit="trans -s en -t it"
alias r=ranger

# Remove clutter from home
set -x -g ATOM_HOME $XDG_DATA_HOME/atom
set -x -g GEM_HOME $XDG_DATA_HOME/gem
set -x -g GEM_SPEC_CACHE $XDG_CACHE_HOME/gem
set -x -g GNUPGHOME $XDG_DATA_HOME/gnupg
set -x -g GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -x -g GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x -g JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
set -x -g WINEPREFIX $XDG_DATA_HOME/wine32
set -x -g RBENV_ROOT $XDG_DATA_HOME/rbenv
set -x -g LESSHISTFILE $XDG_STATE_HOME/less/history
set -x -g PSQL_HISTORY $XDG_DATA_HOME/psql_history
set -x -g ERRFILE "$XDG_CACHE_HOME/X11/xsession-errors"
set -x -g _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -x -g XCURSOR_PATH /usr/share/icons:"$XDG_DATA_HOME"/icons

set -x -g BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -x -g BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -x -g BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle

set RBENV_HOME /home/alex/Software/rbenv
set RBBUILD $RBENV_HOME/plugins/ruby-build/bin
set -x PATH $RBENV_HOME/bin $RBBUILD $PATH
set -x PATH /home/alex/.local/bin $PATH
set -x PATH $GEM_HOME/bin $PATH

alias wget="wget --no-hsts"

# Configure better-ls
set -x -g LS_COLORS (ls_colors_generator)
alias ls="ls-i --color=auto -w (tput cols)"

# Init rbenv
status --is-interactive; and rbenv init - fish | source


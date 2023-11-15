# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/home/sfrick/.nimble/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:"$HOME/git/tools/vacuum"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"

SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_PROMPT_ASYNC=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_JAVA_SHOW=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_CHAR_SYMBOL="λ"
SPACESHIP_CHAR_PREFIX=" "
SPACESHIP_CHAR_SUFFIX=" -> "
SPACESHIP_CHAR_SYMBOL_ROOT="#"

SPACESHIP_PROMPT_ORDER=(dir git exec_time line_sep jobs exit_code char)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -la'
alias gg='lazygit'
# alias vb='fd --base-directory $1 --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

function start() {
  # if [ -e "$PWD/start.sh" ]; then ./start.sh; else echo "no start script exists in this directory"; fi
  if [ -e "$PWD/Makefile" ]; then make start; elif [ -e "$PWD/start.sh" ]; then ./start.sh; else echo "either a makefile nor a build script exists in this directory"; fi
}
alias s='start'

function test() {
  # if [ -e "$PWD/test.sh" ]; then ./test.sh; else echo "no test script exists in this directory"; fi
  if [ -e "$PWD/Makefile" ]; then make test; elif [ -e "$PWD/test.sh" ]; then ./test.sh; else echo "either a makefile nor a build script exists in this directory"; fi
}
alias t='test'

function format() {
  # if [ -e "$PWD/format.sh" ]; then ./format.sh; else echo "no format script exists in this directory"; fi
  if [ -e "$PWD/Makefile" ]; then make format; elif [ -e "$PWD/format.sh" ]; then ./format.sh; else echo "either a makefile nor a build script exists in this directory"; fi
}
alias f='format'

function build() {
  if [ -e "$PWD/Makefile" ]; then make build; elif [ -e "$PWD/build.sh" ]; then ./build.sh; else echo "either a makefile nor a build script exists in this directory"; fi
}
alias b='build'

function ide() {
  if [ -e "$PWD/ide.sh" ]; then ./ide.sh; else echo "no ide startup script exists in this directory"; fi
}

function v() { 
  fd --base-directory "$1" --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs -I {} nvim "$1/"{}
}

function p() { 
  fd --base-directory "$1" --type d --hidden --exclude .git | fzf-tmux -p --reverse | xargs -I {} nvim "$1/"{}
}

function sd() {
  z "$1/$(fd --base-directory "$1" --type d --hidden --exclude .git | fzf-tmux -p --reverse)"
}

function sg() {
  git=~/git
  z "$git/$(fd --base-directory "$git" --type d --hidden --exclude .git | fzf-tmux -p --reverse)"
}

function vpnkill() {
  nmcli con show --active | awk '{print $1}' | grep "vpn" | xargs /usr/bin/nmcli con down
}

function adctoken() {
  client_secret=bbbbbbbbb
   curl -s -X POST -d "grant_type=password&username=aaaa&password=aaaaa&client_id=apigateway&client_secret=$client_secret" http://fasdljfklsdjfl/openid-connect/token \
     | jq -r '.access_token' \
     | wl-copy
}

function ma(){
  docker run --rm -it wernight/funbox cmatrix
}


# DOCKER Stuff
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
alias docks='dockerd-rootless > /dev/null 2>&1 &'


[ -r ~/.shell.sh ] && source ~/.shell.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -e /home/sfrick/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sfrick/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# opam configuration
[[ ! -r /home/sfrick/.opam/opam-init/init.zsh ]] || source /home/sfrick/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bindkey -v
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(
#   vi-mode
# )
# Download Znap, if it's not there yet.
[[ -r ~/git/tools/zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/git/tools/zsh-plugins/znap
source ~/git/tools/zsh-plugins/znap/znap.zsh  # Start Znap
# Zsh plugins
# znap source marlonrichert/zsh-autocomplete
# znap source softmoth/zsh-vim-mode
eval "$(zoxide init zsh)"



[[ -s "/home/sfrick/.gvm/scripts/gvm" ]] && source "/home/sfrick/.gvm/scripts/gvm"

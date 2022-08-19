# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="garyblessington"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias srczsh="source ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias pp="cd ~/PicPay"
alias vpn="~/.connectVPN.sh"
alias gcr='git checkout release'
alias gglog='git log --graph --oneline --decorate --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all | emojify | less -r'
alias gcmsge='gcmsg | emojify'
alias chrome-dev='/usr/bin/google-chrome-stable %U --disable-web-security --allow-running-insecure-content --profile-directory="Profile1" --user-data-dir="/tmp"'
alias yall='yarn lint && yarn test && yarn build'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH="/usr/local/git/bin:$PATH"
alias moc="./scripts/moc-client"
alias nx="./node_modules/.bin/nx"
alias fera="cd ~/Fera"
alias pp-herodash-front="cd ~/Picpay/picpay-dev-ms-herodash-front"
alias pp-herodash-api="cd ~/Picpay/picpay-dev-ms-herodash-api"
alias pp-monorepo="cd ~/Picpay/picpay-frontend"

# Setup multiple selection for FZF
# export FZF_DEFAULT_OPTS='--multi --no-height --extended'

alias pp-ecommerce-front="cd ~/Picpay/picpay-dev-ms-ecommerce-front"
export COMPOSER_AUTH='{"github-oauth": {"github.com": "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"}}'

export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
alias picpay-login="aws-google-auth"
alias picpay-aws-ls="cat ~/.aws/config | grep '[' "

nx-sellerpanel () {
  if [[ -n "$1" ]]; then
    for lib in "$@"
      do
        nx $1 seller-panel-$2
      done
    else
      echo "\n    Usage: nx-sellerpanel [param] [lib] \n
        Ex: \r
        - nx-sellerpanel test 'services' 'shared' \r
        - nx-sellerpanel lint 'services' 'shared' 'charge' \n"
  fi
}

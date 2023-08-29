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

# Press esc to use vi commands
set -o 'vi'

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
alias zshconfig="nvim ~/.zshrc"
alias srczsh="source ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vpn="~/.connectVPN.sh"
alias gcr='git checkout release'
alias gglog='git log --graph --oneline --decorate --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all | emojify | less -r'
alias gcmsge='gcmsg | emojify'
alias chrome-dev='/usr/bin/google-chrome-stable %U --disable-web-security --allow-running-insecure-content --profile-directory="Profile1" --user-data-dir="/tmp"'
alias yall='yarn lint && yarn test && yarn build'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/git/bin:$PATH"

alias nx="./node_modules/.bin/nx"

# Setup multiple selection for FZF
# export FZF_DEFAULT_OPTS='--multi --no-height --extended'

# Set locally git token (export GIT_TOKEN='xxxxxx')
export COMPOSER_AUTH='{"http-basic": {"github.com": {"username": "HDMiranda", "password": "'$GIT_TOKEN'"}}}'

export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"

# Add ruby gem bin path to environment
# Mac
export PATH="/Users/hardy.miranda/.gem/ruby/2.6.0/bin:$PATH"
# Linux
export PATH="/home/hardy/.local/share/gem/ruby/3.0.0/bin:$PATH"
# RVM
export PATH="/home/hardy/.cache/yay/rvm/src/rvm/:$PATH"
export PATH="/usr/local/rvm:$PATH"
export rvm_path="/usr/local/rvm"
# source /etc/profile.d/rvm.sh

# Fera
alias moc="./scripts/moc-client"
alias fera="cd $FERA_PATH"
alias moc-client="cd $FERA_PATH/moc/packages/client"
alias moc-ds="cd $FERA_PATH/moc/packages/designsystem"

# PP
# Set projects base path locally ($PP_PATH)
# Set projects prefix ($PP_PREFIX)
alias pp="cd ~/$PP_PATH"
alias pp-monorepo="cd ~/$PP_PATH/$PP_PREFIX-frontend"
alias pp-ecommerce-front="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-ecommerce-front"
alias pp-herodash-front="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-herodash-front"
alias pp-mbdash-front="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-mbdash-front"
alias pp-herodash-api="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-herodash-api"
alias pp-sellerpanel-api="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-sellerpanel-api"
alias pp-biz="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-biz"
alias pp-deeplink="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-deeplink"
alias pp-dgdash="cd ~/$PP_PATH/$PP_PREFIX-dev-ms-dgdash"
alias pp-brcode-unique="cd ~/$PP_PATH/ms-brcode-unique"
alias pp-pj-charge="cd ~/$PP_PATH/ms-pj-charge"
alias pp-pj-charge-front="cd ~/$PP_PATH/ms-pj-charge-front"
alias pp-devtools="cd ~/$PP_PATH/devtools"
alias pp-helm-charts="cd ~/$PP_PATH/helm-charts"
alias pp-gatekeeper-providers="cd ~/$PP_PATH/gatekeeper-providers"
alias pp-login="aws-google-auth"
alias pp-aws-ls="cat ~/.aws/config | grep '[' "
alias cols="colima start --cpu 4 --memory 8"

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

## Parquinho fire scripts

# Disable Netskope app
alias nsoff="sudo chmod -x /Applications/Netskope\ Client.app \
  && sudo launchctl unload /Library/LaunchDaemons/com.netskope.client.auxsvc.plist /Library/LaunchDaemons/com.netskope.epdlp.client.plist \
  && sudo kill $(launchctl list | grep netskope | awk '{if($1 != "-") {print $1}}')"

# Enable Netskope app
alias nson="sudo chmod +x /Applications/Netskope\ Client.app \
  && sudo launchctl load /Library/LaunchDaemons/com.netskope.client.auxsvc.plist /Library/LaunchDaemons/com.netskope.epdlp.client.plist \
  && open /Applications/Netskope\ Client.app"

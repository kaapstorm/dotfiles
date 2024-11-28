# Add user's bin to $PATH
# $HOME/bin is shared across dual-boot; $HOME/.local/bin is just this OS
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kaapstorm"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# SSH
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias gbd='git diff `git merge-base master HEAD` HEAD'
alias gmm='git merge master'
alias gpr='echo You mean gpsup'
alias gsur='git submodule update --recursive'
alias ggr='git grep'
alias ggrn='git grep -n'
alias glmsur='git pull-master-recursive'
# "git branch diff" to show GitHub-style diff
# -- http://stackoverflow.com/a/15955008
alias venv='if [[ -d .venv ]] ; then source .venv/bin/activate ; elif [[ -d venv ]] ; then source venv/bin/activate ; fi'
alias nenv='if [[ -d nenv ]] ; then source nenv/bin/activate ; fi'
alias dotenv='export $(grep -v "^#" .env | xargs -d "\n")'

# For Dimagi GPG keyring
alias dimagi-gpg='gpg --keyring dimagi.gpg --no-default-keyring'

# For commcare-hq
#export CCHQ_STRICT_WARNINGS=1
export CCHQ_WHITELISTED_WARNINGS=ignore
export PYTHONWARNINGS=ignore
#export DOCKER_HQ_POSTGRES_VERSION=10

# For commcare-cloud
# https://confluence.dimagi.com/pages/viewpage.action?pageId=106629646
export COMMCARE_CLOUD_USE_AWS_SSM=1
export COMMCARE_CLOUD_REPO=$HOME/src/dimagi/commcare-cloud

# Use a sane date format
export LC_TIME=en_GB.UTF-8

# Use atuin for shell history
eval "$(atuin init zsh --disable-up-arrow)"

# Launch gpg-agent for Git
export GPG_TTY=`tty`
gpgconf --launch gpg-agent

# Configure Daniel Miller's load script
export LOAD_HOME=$HOME/opt/load
source $LOAD_HOME/.load.sh

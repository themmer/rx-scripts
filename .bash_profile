
export PATH=$PATH:.

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias ls='ls -laghFG'
alias ll='ls -laghFG'
alias l='ls -laghFG'
alias xcode='open -a xcode'
alias text='open -a TextEdit'
alias pre='open -a Preview'
alias cd..='cd ..'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias edit='vim'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias ports='netstat -tulanp'
alias ping='ping -c 5'
alias cpu='top -o cpu'
alias mem='top -o rsize' 
alias ip="curl icanhazip.com"
alias stfu="osascript -e 'set volume output muted true'"

#history
export HISTSIZE=2000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT=

# My dirs
export UI_HOME=/Users/themmer/dev/front
export TOMCAT_HOME=/Users/themmer/installs/
export SERVICE_HOME=/Users/themmer/dev/service/

#git
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias co='checkout'
export PS1="\n◆ \[\e[01;33m\]\t \[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "

git config --global color.ui true
git config --global format.pretty oneline
git config --global core.autocrl input
git config --global core.fileMode true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias push='git pull origin master && git push origin master'
alias pull='git pull origin master'
alias clone='git clone $1'

export JAVA_HOME=$(/usr/libexec/java_home)
export ELASTICSEARCH_HOME=/usr/local/opt/elasticsearch17/
export LOGSTASH_HOME=/Users/themmer/installs/logstash-1.5.6/

export MYSQL_HOME=/usr/local/Cellar/mysql/5.7.10/
alias start_mysql='$MYSQL_HOME/bin/mysqld'
alias stop_mysql='$MYSQL_HOME/bin/mysqladmin shutdown'

export PHANTOM_JS_HOME=/Users/themmer/installs/phantomjs-2.1.1-macosx
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH=$PATH:$PHANTOM_JS_HOME/bin:$LOGSTASH_HOME/bin

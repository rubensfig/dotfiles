# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias python='python2.7'
alias lock='sh /usr/local/bin/i3lock-fancy/lock'
alias runcawr=' cd ~/code/vagrant/cawr && vagrant ssh'
alias vssh='vagrant ssh'
alias activate='if [ ! -d .env ]; then 
                    virtualenv .env
                fi
                source .env/bin/activate'
alias xxx='xdg-open'
alias vcd='cd ~/code/vagrant/ && cd $1'
alias findfile='find . -name $1'

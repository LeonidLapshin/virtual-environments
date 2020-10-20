if [ -f "$HOME/.bash-preexec.sh" ] ; then
    echo "$HOME/.bash-preexec.sh already exists"
else
    echo "initial setup bashrc"
    curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
    echo '[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh' >> ~/.bashrc
    echo '[[ -f ~/.bash-preexec-function.sh ]] && source ~/.bash-preexec-function.sh' >> ~/.bashrc
fi

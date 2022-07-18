alias mv='mv -i'
alias rm='rm -i'
alias clr='clear'
alias vi='vim'
alias transch='trans :ch'
alias tmatach='tmux attach-session'
alias tmlist='tmux list-session'
alias 2lastDir='cd $OLDPWD'
alias 2lD='cd $OLDPWD'
alias act_venv='source ./bin/activate' # activate virtual env environment under current dir
alias ranger2='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"' # cd into the last directory ranger has been to when exit ranger
alias grep_process='ps -aux | grep grep -v | grep'
alias show_gpu='nvidia-smi && echo cuda:$CUDA_VISIBLE_DEVICES'
alias fscnt='du -sh ./*' # count file size at this directory

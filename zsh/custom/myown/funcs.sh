# shell functions

# git init a directory and .gitignore template from github, from https://stackoverflow.com/questions/17932658/git-init-with-option-for-auto-creation-of-a-default-gitignore
git_init_more(){
    git init .
    curl -o .gitignore --fail --show-error --silent --location https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore
    git add .gitignore && git commit -m "added gitignore from GitHub"
}

blinkshell(){
    # source config file for current shell
    cur_shell=$(ps -p $$ | tail -1 | awk '{print $NF}')
    exec $cur_shell
}

clrpycache(){
    find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
}

# print out colors in terminal
term_colors(){
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# remove all ansi characters in a file and output to no_ansi file
escape_ansi(){
    cat $1 | sed 's/\x1b\[[0-9;]*m//g' > $1.no_ansi
}

onproxy(){
    # set proxy port
    export HTTP_PROXY="127.0.0.1:$1"
    export HTTPS_PROXY="127.0.0.1:$1"
}

noproxy() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
}

mdcd(){
    # make dir and cd it
    mkdir $1; cd $1
}

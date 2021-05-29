# shell functions

# git init a directory and .gitignore template from github, from https://stackoverflow.com/questions/17932658/git-init-with-option-for-auto-creation-of-a-default-gitignore
git_init_more(){
    git init .
    curl -o .gitignore --fail --show-error --silent --location https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore
    git add .gitignore && git commit -m "added gitignore from GitHub"
}

uninstall(){
    sudo apt --auto-remove $1
}

blinkshell(){
    # source config file for current shell
    cur_shell=$(ps -p $$ | tail -1 | awk '{print $NF}')
    exec $cur_shell
}

clrpycache(){
    find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
}

updatePacs(){
    # TODO: check platform 
    sudo pacman -Syyu
}

rmPac(){
    # TODO: check platform
    sudo pacman -R $1
}

rmNoUsePac(){
    # TODO: check platform 
    sudo pacman -R $(sudo pacman -Qdt)
}

term_colors(){
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

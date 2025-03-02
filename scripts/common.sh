# install conda
install_conda(){
    if ! type conda >/dev/null 2>&1; then
        #if [ "$choice" = ]
        #read -p "install conda or not(y/n)"
        echo "installing conda"
        # download sh
        UNAME=$(uname | tr "[:upper:]" "[:lower:]")
        if [ "$UNAME" == "linux" ]; then
            curl --output miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
        elif [ "$UNAME" == "darwin" ]; then
            curl --output miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh 
        fi
        # install to ~/.miniconda
        bash miniconda.sh -b -p $HOME/.miniconda3
        # delete miniconda installation sh file
        rm miniconda.sh
        echo "conda install done"
        type conda
    else
        #echo "$(which conda)"
        echo "conda installed"
        type conda
    fi
}


install_conda

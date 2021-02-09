# shell functions


# git init a directory and .gitignore template from github, from https://stackoverflow.com/questions/17932658/git-init-with-option-for-auto-creation-of-a-default-gitignore
git_init_more(){
    git init .
    curl -o .gitignore --fail --show-error --silent --location https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore
    git add .gitignore && git commit -m "added gitignore from GitHub"
}

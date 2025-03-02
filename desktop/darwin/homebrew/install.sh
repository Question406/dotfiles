# !/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# Install Homebrew
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew packages
brew install --cask nikitabobko/tap/aerospace
cat essential.txt | xargs brew install
softwareupdate --all --install --force

echo "Updating Brew"
brew update && brew upgrade
brew outdated --cask && brew upgrade --cask
brew cleanup -s

echo "Brew Diagnostics"
brew doctor
brew missing

echo "Updating nvim plugins"
nvim --headless +PlugUpgrade +qall
nvim --headless +PlugUpdate +qall

echo "Updating npm packages"
npm outdated -g && npm update -g

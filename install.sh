#!/usr/bin/env bash

NAME="Christian"

echo ==========================================================================
echo
echo $'\t' Setting up $NAME\'s dev environment
echo
echo ==========================================================================


# Function: Check if commands exist
command_exists() {
  type "$1" &> /dev/null ;
}


# Homebrew
echo Installing Homebrew
echo ----------------------------

if command_exists brew ; then
  echo Brew already installed, updating now
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo
echo
echo Things to install with Brew
echo ----------------------------

brew install archey
brew install carthage
brew install cmake
brew install cowsay
brew install fortune
brew install git
brew install go
brew install macvim
brew install python
brew install python3
brew install spark
brew install tmux

echo ============================


# NVM
echo Install NVM
echo ----------------------------

if command_exists nvm ; then
  echo NVM already installed, updating now
fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash

echo
echo
echo Install latest node
echo ----------------------------
nvm install stable

echo ============================


# RVM
echo Installing RVM
echo ----------------------------

if command_exists rvm ; then
  echo RVM already installed, updating now
  rvm get stable
else
  curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby
fi

echo ============================


# Vundle
echo Installing Vundle
echo ----------------------------

if [ -d ~/.vim/bundle/Vundle.vim ]; then
  echo "Vundle Installed"
else
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ============================


# TPM
echo Installing TPM
echo ----------------------------

if [ -d ~/.tmux/plugins/tpm ]; then
  echo "TPM Installed"
else
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo ============================


# Install OhMyZsh
echo Installing Oh My Zsh
echo ----------------------------

if [ -d ~/.oh-my-zsh ]; then
  echo "Oh My Zsh Already Installed"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo ============================


# Copy dotfiles
echo Copying dotfiles
echo ----------------------------

cp ./tmux.conf ~/.tmux.conf
cp ./zshrc ~/.zshrc
cp ./vimrc ~/.vimrc
cp ./avitcl.zsh-theme ~/.oh-my-zsh/custom/themes/avitcl.zsh-theme
cp ./zsh-battery /usr/bin/zsh-battery

echo ============================


# VIM Install Plugins
echo Installing VIM Plugins
echo ----------------------------

vim +PluginInstall +qall

echo ============================


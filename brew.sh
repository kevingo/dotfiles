#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="


# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# Install cli tools
brew install ack
brew install tree
brew install wget

# Install system tools
brew install postgresql
brew install go
brew install redis
brew install httpie
brew install the_silver_searcher
brew install htop

# Install software
brew cask install iterm2
brew cask install sublime-text
brew cask install virtualbox
brew cask install macdown
brew cask install google-chrome
brew cask install cheatsheet
brew cask install firefox
brew cask install postico
brew cask install filezilla
brew cask install postman
brew cask install visual-studio-code
brew cask install postgres
brew cask install slack

brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

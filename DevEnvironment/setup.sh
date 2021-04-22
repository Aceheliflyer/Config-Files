#!/usr/bin/env sh
# -*- coding: utf-8 -*-

# Update & Upgrade System
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Get Git CLI repository.
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages

# Get GitLFS repository.
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

# Install essential software.
sudo apt install -y \
  zsh fzf neofetch \
  gh git-lfs \
  ruby-full build-essential \
  python3-dev python3-pip python3-setuptools

sudo gem install colorls
sudo pip3 install bpytop

# Install Dry for Docker.
curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
sudo chmod 755 /usr/local/bin/dry

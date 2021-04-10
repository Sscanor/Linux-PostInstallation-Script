#!/bin/bash

set -e 

# -------------------------------------------------------------------------------------------------------#

apt_programs=( git vagrant virtualbox python3 mlocate docker default-jre default-jdk postgresql 
               apt-transport-https curl plank software-properties-common brave-browser brave-keyring
               code pycharm gimp ulauncher )

all_deb=( "./*.deb" )

ppas=( agornostal/ulauncher graphics-drivers/ppa viktor-krivak/pycharm )

arch_repositories=( "[arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"
                    "[arch=amd64] https://packages.microsoft.com/repos/vscode stable main")

downloads=(  ) # If you have a package .deb

keys_repository=( "https://brave-browser-apt-release.s3.brave.com/brave-core.asc"
                  "https://packages.microsoft.com/keys/microsoft.asc" )

snaps=( spotify )

# -------------------------------------------------------------------------------------------------------#

cd $(mktemp -d)

# Uncomment the line below if you have placed .deb files in downloads=()
# echo "Downloading files..." && sleep 1 && wget -nv -c ${downloads[@]}

echo "Downloading repository keys..." && sleep 1 
for key in ${keys_repository[@]}; do
  wget -q  $key -O- | apt-key add -
done

echo "Updating..." && sleep 1 && apt update

echo "Adding repositories deb..." && sleep 1 
for repository in ${repositories[@]}; do
  apt-add-repository "deb "$repository -y
done

echo "Adding repositories ppa..." && sleep 1 
for ppa in ${ppas[@]}; do
  apt-add-repository "ppa:"$ppa -y
done

echo "Updating..." && sleep 1 && apt update

echo "Installing apt programs..." && sleep 1 && apt install ${apt_programs[@]} -y

echo "Installing snap programs..." && sleep 1 && snap install ${snaps[@]}

# Uncomment the line below if you have placed .deb files in downloads=()
# echo "Installing .deb programs..." && sleep 1 && apt install $all_deb

echo "Dist-upgrading..." && sleep 1 && apt dist-upgrade -y

echo "Cleaning packages..." && sleep 1 && apt autoclean 

echo "Installation completed"

# -------------------------------------------------------------------------------------------------------#
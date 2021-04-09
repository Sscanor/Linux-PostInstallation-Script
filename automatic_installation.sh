#!/usr/bin/env bash

set -e 

apt_programs=( git vagrant virtualbox python3 mlocate docker default-jre default-jdk postgresql 
               apt-transport-https curl plank software-properties-common brave-browser brave-keyring
               code pycharm gimp ulauncher)

ppas=( agornostal/ulauncher graphics-drivers/ppa viktor-krivak/pycharm )

repositories=( "deb http://ppa.launchpad.net/viktor-krivak/pycharm/ubuntu zesty main"
               "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"
               "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
               )

downloads=( "https://brave-browser-apt-release.s3.brave.com/brave-core.asc"
             )

snaps=( spotify )

keys=( "https://brave-browser-apt-release.s3.brave.com/brave-core.asc" )

#--------------------------------------------------------------------------------------------------

cd $(mktemp -d)
wget -nv -c ${downloads[@]}
apt-key add ${keys[@]}
apt update

for repository in ${repositories[@]};; do
  apt-add-repository "$repositorio" -y
done

for ppa in ${ppas[@]};; do
  apt-add-repository "ppa:"$ppa -y
done

apt update

apt install ${apt_programs[@]} -y
snap install ${snaps[@]}

# apt install ./*.deb - For programs .deb

apt dist-upgrade -y
apt autoclean 

echo "Installation completed"

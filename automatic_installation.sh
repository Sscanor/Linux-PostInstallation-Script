#!/usr/bin/env bash

set -e 

apt_programs=( git vagrant virtualbox python3 mlocate docker default-jre default-jdk postgresql 
               apt-transport-https curl plank software-properties-common brave-browser brave-keyring
               code pycharm  )

ppas=( agornostal/ulauncher otto-kesselgulasch/gimp graphics-drivers/ppa viktor-krivak/pycharm )

repositories=( "deb http://ppa.launchpad.net/viktor-krivak/pycharm/ubuntu zesty main"
               "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"
               "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
               )

downloads=( "https://brave-browser-apt-release.s3.brave.com/brave-core.asc"
             )

snaps=( spotify )

keys=( "https://brave-browser-apt-release.s3.brave.com/brave-core.asc" )
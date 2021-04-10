# Post Installation Script

I'm Brazilian and I'm learning English, feel free to correct me :)

The purpose of this script is basically to automate the installation of programs that I use regularly, facilitating and optimizing the whole process using 
.deb packages, installation via apt, snap, and ppa.



## Installation details of the programs

This script was tested on Ubuntu 20.04, feel free to test in other distros!

### This script will install:

- Vagrant
- Virtualbox
- Python3
- Mlocate
- Docker
- Default-jre (Java Runtime Environment)
- Default-jdk (Java Development Kit)
- Postgresql
- Apt-transport-https
- Curl
- Plank
- Software-properties-common
- Brave-browser
- Brave-keyring
- Code (Visual Studio Code)
- Pycharm
- Gimp
- Ulauncher

---

## How to use

Initially, clone the repository in some directory on your machine.

```bash
git clone https://github.com/gugamenezes/Automatic-installation-script.git
```

After that, run chmod + x to make the file executable.

```bash
sudo chmod +x automatic_installation.sh
```

Run the automatic_installation.sh file as root.

```bash
sudo ./automatic_installation.sh
```

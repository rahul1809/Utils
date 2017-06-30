#!/bin/bash

#Author: Rahul Mishra
#Email: rahul.mishra2003@gmail.com
#Description: Complete Development Setup Script on Ubuntu Machine




# Enable canonical repos
sed -i.bak "/^# deb [^cdrom].*/ s/^# //" /etc/apt/sources.list



#add all the repositories here.
add-apt-repository ppa:shutter/ppa -y
add-apt-repository ppa:webupd8team/sublime-text-3 -y
add-apt-repository ppa:damien-moore/codeblocks-stable -y
add-apt-repository ppa:webupd8team/java -y
add-apt-repository ppa:me-davidsansome/clementine -y


# update the system
apt-get update


packages="synaptic gdebi-core ubuntu-wallpapers-* ubuntukylin-wallpapers-* ubuntustudio-wallpapers adobe-flashplugin  ubuntu-restricted-extras libavcodec-extra vlc unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip plzip guake guake-indicator shutter sublime-text-installer samba codeblocks git oracle-java8-installer oracle-java8-set-default eclipse clementine  python2.7 python-pip python-dev  ipython ipython-notebook jupyter"

# Installing starting packages
echo "******************************************************"
echo "               Installing Packages                    "
echo "******************************************************"
apt-get install -y $packages





echo "******************************************************"
echo "               Upgrading the System                   "
echo "******************************************************"
# finally upgrade the system and get distribution upgrade
apt-get upgrade -y && apt-get dist-upgrade -y


#cleaning up the system
echo "******************************************************"
echo "               CleaningUp the System                  "
echo "******************************************************"

apt-get autoremove -y

# Disable apport
sed -i.bak "s/^enabled=[01]$/enabled=0/" /etc/default/apport
service apport restart




# Install Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &



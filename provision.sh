#!/usr/bin/env bash
# Author: Robert MacDavid (macdavid@cs.princeton.edu)

# The machine's $HOME path is different during provisioning, so we can't use '~' in this script
# Match these variables to what your chosen box uses
HOME_DIR="/home/vagrant"
USER_NAME="vagrant"


# Some initial dependencies
cd $HOME_DIR
sudo apt-get update -y
sudo apt-get -y install git python-pip
sudo pip install --upgrade pip
sudo pip install scapy thrift networkx
# Set git identity
git config --global user.email p4@p4.p4
git config --global user.name p4


# Download and compile Mininet from source (apt-get mininet has issues in ubuntu 16.xx)
cd $HOME_DIR
git clone git://github.com/mininet/mininet mininet
cd mininet
sudo ./util/install.sh -a
cd $HOME_DIR


# Install protobuf from source (P4-Compiler dependency)
cd $HOME_DIR
sudo apt-get install -y autoconf automake libtool curl make g++ unzip
sudo apt-get install -y doxygen graphviz texlive-full
git clone https://github.com/google/protobuf.git protobuf
cd protobuf
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig # refresh shared library cache.
cd $HOME_DIR


# if you're desperate to use an ubuntu earlier than 16.10, running this block will let you compile p4c
#sudo add-apt-repository ppa:ubuntu-toolchain-r/test
#sudo apt-get update
#sudo apt-get install gcc-4.9 g++-4.9
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
#sudo apt-get install clang-3.3


# Install P4 Compiler
cd $HOME_DIR
git clone --recursive https://github.com/p4lang/p4c.git p4c
sudo apt-get install -y g++ git automake libtool libgc-dev bison flex libfl-dev libgmp-dev libboost-dev libboost-iostreams-dev pkg-config python python-scapy python-ipaddr tcpdump
cd p4c
./bootstrap.sh
cd build
make -j4
make check -j4
sudo make install
cd $HOME_DIR


# Install P4 Behavioral Model 2
cd $HOME_DIR
git clone https://github.com/p4lang/behavioral-model.git bmv2
cd $HOME_DIR/bmv2
./install_deps.sh
./autogen.sh
# For high-performance BMV2, use the alternative configure line below
# ./configure --disable-logging-macros --disable-elogger 'CXXFLAGS=-O2'
./configure
make
sudo make install
cd $HOME_DIR


# That other P4 thing we need
cd $HOME_DIR
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
cd $HOME_DIR/p4c-bmv2
sudo pip install -r requirements.txt
sudo pip install -r requirements_v1_1.txt
sudo python setup.py install
cd $HOME_DIR


# Download P4 2017 Tutorial
cd $HOME_DIR
git clone https://github.com/p4lang/tutorials.git p4_tutorial
cd $HOME_DIR


# Some other things. Donut remove or everything breaks
cd $HOME_DIR
sudo apt-get -y install xorg openbox
sudo ldconfig
sudo modprobe sch_netem
sudo apt-get --reinstall install man
cd $HOME_DIR


# Install the syntax highlighter stuff
sudo apt-get install -y vim-gtk emacs
cp /vagrant/syntaxfiles/emacs/.emacs $HOME_DIR
cp -r /vagrant/syntaxfiles/emacs/.myemacs $HOME_DIR
cp -R /vagrant/syntaxfiles/vim/ $HOME_DIR
mv $HOME_DIR/vim $HOME_DIR/.vim

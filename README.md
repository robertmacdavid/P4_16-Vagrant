# P4_16 Vagrant

This project aims to provide a vagrant configuration which allows immediate development and testing of P4_16 code. 
In addition to installing all libraries needed to complete the P4 Developer's Day 2017 tutorial, 
this repo includes P4_16 syntax highlighting configs for both Emacs and Vim, which are automatically 
installing during vagrant provisioning.

## Getting Started

Simply clone this repo and call "vagrant up" in the home directory of the project.

### Prerequisites

The only prerequisite is an up-to-date installation of vagrant. 

### Installing

Installation is quite simple:
```
$ git clone https://github.com/robertmacdavid/P4_16-Vagrant.git p4_16-vagrant
$ cd p4_16-vagrant
$ vagrant up
```

This step requires patience when run for the first time.
Provisioning the VM can take upwards of an hour.

After provisioning completes, call:

```
$ vagrant ssh
```

If you have problems with xterm in mininet, instead use the command

```
$ vagrant ssh -- -X
```

The vagrant project directory on your host machine is synced to the guest VM
as the directory /vagrant/.

## Running the tutorial

After SSHing, the P4_16 tutorial is located at 
```
~/p4_tutorial/P4D2_2017/exercises/
```
Instructions for completing the tutorial can be found in the P4 github repo at: https://github.com/p4lang/tutorials/blob/master/P4D2_2017/exercises/README.md

## After completion
If you make modifications to the VM and are no longer able to run any p4 code, call
```
$ vagrant destroy
$ vagrant up
```
to reprovision. WARNING: This will delete all files in the VM except for
those in the /vagrant/ directory. Reprovisioning is not recommended unless absolutely necessary, since
it takes so gosh dang long.

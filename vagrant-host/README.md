## Configure local VM using Vagrant and VirtualBox
This section describes what's needed to build a vagrant project using Ubuntu.  This Vagrant VM will be named 'local-vm1'.  will identify the needed dependencies for running vagrant and how to install each.  After Vagrant is installed, the vagrant project is downloaded and built locally.  The result is a running VM on your Mac with a specific configuration.  The VM includes Terraform, AWS CLI, and Ansible.

### Initial Setup
You'll need HomeBrew, VirtualBox, Vagrant, and Git installed locally to begin.

Update HomeBrew and all formulae.
```bash
$ brew update
$ brew upgrade
```

Verify VirtualBox is up to date using Brew.
```bash
$ brew cask update VirtualBox
```

Install Vagrant with Brew.
```bash
$ brew cask install vagrant
```

Download vagrant project for training
```bash
$ git clone https://github.com/wardviaene/devops-box
```

Start vagrant image
```bash
$ vagrant up
```

Check config before attempting to ssh into local-vm1.  Should look like:



# tools included
* Terraform
* AWS CLI
* Ansible

## Configure local VM using Vagrant and VirtualBox
This section describes how to quickly build a Vagrant project running Ubuntu Xenial64.  In this case Vagrant will run on VirtualBox (VB), and the new instance will be named 'devops-vb'.  The needed dependencies within the VB will be installed via script.  The result is a running VB on your Mac with Terraform, AWS CLI, and Ansible installed.

### Initial Setup
You'll need HomeBrew to complete the following steps.  If HomeBrew is not installed go to https://docs.brew.sh/ and follow the instructions to get started.

If HomeBrew was installed, update HomeBrew and all formulae.
```console
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
$ git clone https://github.com/cheznic/DevOps-with-Terraform/
```

Change directory
```bash
$ cd vagrant-host
```

Start vagrant image (this will take some time)
```bash
$ vagrant up
```

Check config before attempting to ssh into devops-vb.  Should look like:
```bash
$ vagrant ssh-config
Host devops-vb
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile [project-folder]/vagrant-host/.vagrant/machines/devops-vb/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

Connect to 'devops-vb'
```bash
$ vagrant ssh
```

### Tools installed in the VM
- Terraform
- AWS CLI
- Ansible

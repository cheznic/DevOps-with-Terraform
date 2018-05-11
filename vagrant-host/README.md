## Configure local VM using Vagrant and VirtualBox
This section describes how to quickly build a Vagrant project running Ubuntu Xenial64.  In this case Vagrant will run on VirtualBox (VB), and the new instance will be named 'devops-vb'.  Additional packages within the VB will be installed via script.  The result is a running VB on your Mac with Terraform, AWS CLI, and Ansible installed.

### Initial Setup
You'll need HomeBrew to complete the following steps.  If HomeBrew is not installed go to <https://docs.brew.sh/> and follow the instructions to get started.

1. If HomeBrew is installed, update HomeBrew and all formulae.
```bash
$ brew update
$ brew upgrade
```

1. Install VirtualBox if you don't have it.
```bash
$ brew cask install VirtualBox
```

1. Install Vagrant if you don't have it.
```bash
$ brew cask install vagrant
```

1. Download vagrant project for training
```bash
$ git clone https://github.com/cheznic/DevOps-with-Terraform/
```

1. Change directory
```bash
$ cd vagrant-host
```

1. Start vagrant image (this will take some time)
```bash
$ vagrant up
```

1. Review config for devops-vb.  Should look similar to:
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

1. Connect to 'devops-vb'
```bash
$ vagrant ssh
```

1. Confirm that Terraform is installed on the VB.
```bash
vagrant@devops-vb:~$ terraform
usage: terraform [--version] [--help] <command> [args]
...
```


### Tools installed in the VM
- Terraform
- AWS CLI
- Ansible

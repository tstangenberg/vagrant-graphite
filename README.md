vagrant-graphite
==================

Instant provisioning of [Graphite][1] with the help of [Vagrant][2] & [Puppet][3] 

What will it do?
----------------

1. Download Ubuntu 12.04
1. Create a new virtual machine, install Ubuntu and forward port 80 to 9000 and 2003 to 2003
1. Inside the virtual machine 
  1. Download & Install [Python][6]
  1. Download & Install [Apache][9]
  1. Download & Install & Start [Graphite][1]
 
Do it!
------

1. Install [VirtualBox][4] and [Vagrant][2] and make sure you have [git][5] available.
1. Open your favorite terminal (mine is [iTerm2][7]) and clone the github repository 

```
git clone --recursive https://github.com/tstangenberg/vagrant-graphite.git
cd vagrant-graphite
```

1. Start up and provision automatically all dependencies in the vm

```
vagrant up --provision
```

1. Open the [graphite page][8] (http://localhost:9000)
1. Log in with user "admin" and password "admin"
1. Configure your graphs 



[1]: http://graphite.wikidot.com/
[2]: http://www.vagrantup.com/
[3]: http://puppetlabs.com/
[4]: https://www.virtualbox.org 
[5]: http://git-scm.com
[6]: http://www.python.org/
[7]: http://www.iterm2.com
[8]: http://localhost:9000
[9]: http://httpd.apache.org/

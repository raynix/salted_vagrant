# salted_vagrant
Test provisioning Vagrant VMs with Salt. Using https://github.com/UtahDave/salt-vagrant-demo as boilerplates.

## Preferred Environment
1, Ubuntu Desktop 16.04 x64
2, VirtualBox 5.0.32

## Instructions

### Provisioning 3 VMs
- Install Vagrant from https://www.vagrantup.com/downloads.html because the stock version has issues with OS guests.
- `cd salted_vagrant`
- `vagrant plugin install vagrant-vbguest`
- `vagrant up`

### Run salt formulas
- `vagrant ssh master`
- `# in master`
- `sudo -i`
- `salt \* state.apply`


It will run into some MySQL access denied problem in the first run, I think it's something with the included mysql-formula. Run it a second time will fix it. There were 4 nginx formula errors concerning loggers which can be ignored for now.

With my limited Salt experience(~2 hours), I haven't figured out an elegant way to reload service when a custom configuraton file changes, eg. when nginx site config changes the service should be reloaded. In Ansible which I'm familar with, any task can notify a handler even from a different playbook which is quite handy. For now I'll manually restart 2 services:

- `salt minion1 service.restart nginx`
- `salt minion1 service.restart php7.0-fpm`

### Setup Drupal
The webserver's IP is fixed to 192.168.50.11, and a local domain `drupalsite.com` should be added to your desktop:
```
# /etc/hosts
192.168.50.11 drupalsite.com
```
Then you should be able to set up Drupal 8.2.6 in a browser at http://drupalsite.com. Database access:
```
host: 192.168.50.12
user: drupal
pass: drupal
db: drupal
```

### Presure Test
Using ApacheBench `ab` to test the setup:
```
ab -n 400000 -c 100 http://drupalsite.com/
```
And monitoring load/memory/IO on minion1 and minion2 to see what could be the bottleneck.







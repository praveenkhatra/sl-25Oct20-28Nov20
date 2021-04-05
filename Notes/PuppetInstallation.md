## ###################################
## Puppet Infrastructure Set-up
## ###################################

=====================================
## Puppet Server
## Tested on Ubuntu 18.04
## Make sure the memory is at least 2G in order for optimal performance
=====================================

1. Add the Puppet repository in Ubuntu:
sudo -i
wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
dpkg -i puppet6-release-bionic.deb
apt update

##use the following repo link for Ubuntu 16.04
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb

2. Remove .deb package now that the repository is set up (Optional):
rm puppet6-release-bionic.deb

3. Edit /etc/hosts
- Open /etc/hosts and move the hostname mapping to the localhost:
- 127.0.0.1 <fqdn> localhost puppet puppetserver
vi /etc/hosts
or
nano /etc/hosts

check "ping puppet"

# Install Java
sudo apt-get install openjdk-8-jdk

4. Install Puppet
apt-get install puppetserver

5. Modify Java heap memory allocation:
- /etc/default/puppetserver

edit the following line:
JAVA_ARGS="-Xms2g -Xmx2g -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"

to:
JAVA_ARGS="-Xms512m -Xmx512m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"


6. Set Up the Certificate Authority
/opt/puppetlabs/bin/puppetserver ca setup


7. Start the Puppet Server
systemctl start puppetserver
systemctl enable puppetserver => Making it persistent across boots

8. Check puppet version
root@master:~# puppetserver --version
puppetserver version: 6.3.0

** Note: Run the following command to add puppetserver to your default commands in linux, if it's not identified by default:
export PATH=$PATH:/opt/puppetlabs/bin/


=====================================
## Puppet Agent [Ubuntu]
## Tested on Ubuntu 18.04
=====================================

1. Edit "/etc/hosts" and add the following line:
- <puppetserverip> puppet puppetserver

2. Add Puppet repository:
wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
dpkg -i puppet6-release-bionic.deb
apt update

##use the following repo link for Ubuntu 16.04
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb

3. Install Puppet Agent:
sudo apt-get install puppet-agent

4. Start Puppet Agent:
sudo systemctl start puppet
sudo systemctl enable puppet

5. Edit "/etc/puppetlabs/puppet/puppet.conf" and add the following line:
[main]
server = puppet

## in actual prod environment you would add something like
[main]
server = puppet.mycompany.com # FQDN of your puppet server


=====================================
## Puppet Agent [CentOS]
=====================================

1. Edit "/etc/hosts" and add the following line:
- <puppetserverip> puppet puppet-master

2. Add puppet repo:
sudo rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
sudo yum update

3. Install Puppet Agent:
sudo yum install puppet-agent

4. Start Puppet Agent:
sudo systemctl start puppet
sudo systemctl enable puppet

5. Edit "/etc/puppetlabs/puppet/puppet.conf" and add the following line:
[main]
server = puppet
[master]
[node]


=====================================
## Sign certificate on Puppet Master
=====================================

Final step is to sign the certificate for the node on Puppet server:

1. List all pending certificates to be signed:
- puppetserver ca list

2. Sign pending certificate for the Agent:
- puppetserver ca sign --certname <nodename>

3. Or sign all pending certificates at once:
- puppetserver ca sign --all


.

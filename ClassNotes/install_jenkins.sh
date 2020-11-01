###################################
## Jenkins installation script
## Tested on Ubuntu 18.04
###################################

echo "+++++++++++++++++++++++++++++++++++++++++"
echo "Installing Java (Pre-requisite)"
echo "+++++++++++++++++++++++++++++++++++++++++"
sudo apt update
sudo apt install -y openjdk-8-jdk

echo "+++++++++++++++++++++++++++++++++++++++++"
echo "Updating Jenkins Debian repository"
echo "+++++++++++++++++++++++++++++++++++++++++"
## Add the repository key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

## Append the Debian package repository address
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update

echo "+++++++++++++++++++++++++++++++++++++++++"
echo "Installing Jenkins"
echo "+++++++++++++++++++++++++++++++++++++++++"
sudo apt install -y jenkins

echo "+++++++++++++++++++++++++++++++++++++++++"
echo "Enable and Start Jenkins"
echo "+++++++++++++++++++++++++++++++++++++++++"
sudo systemctl enable jenkins
sudo systemctl status jenkins

echo "+++++++++++++++++++++++++++++++++++++++++"
echo "Jenkins Installation has been completed successfuly!"
echo "+++++++++++++++++++++++++++++++++++++++++"
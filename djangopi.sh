#! /bin/bash

# 
# djangopi
# ========
# A simple django installer for raspberry pi users.
# 
# https://github.com/phalt/DjangoPi
# 
# All code is copyright (c) Paul Hallett 2012
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
# 
# 

echo "\n"
echo "Updating all existing packages...\n"
sudo apt-get -y update

echo "\n"
echo "You'll be asked to enter a password for the database, don't forget it! \n"
sudo apt-get install -y --force-yes mysql-server 
sudo apt-get install -y --force-yes mysql-client
sudo apt-get install -y --force-yes apache2
sudo apt-get install -y --force-yes libapache2-mod-python
# Restart apache to make sure things work
sudo apache2 -k restart

echo "\n"
echo "Installing some essential stuff...\n"
echo "Installing python essentials\n"
sudo apt-get install -y build-essential python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y --force-yes python-mysqldb libmysqlclient-dev 

echo "Now we're going to install django and any other packages\n"
sudo pip install django
sudo pip install -r requirements.txt

echo "\n"
echo "Finally, lets make sure Django is installed properly - this will print the version number\n"
python djangotest.py

echo "\n"
echo "Done! Read the readme file to set up a project\n"
exit 0

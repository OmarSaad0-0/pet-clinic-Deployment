#! /bin/bash
User="saad"
jdk_url="https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.tar.gz"
jdk_path="/home/$User/jdk-22.0.1/bin/java"
java_home="/home/$User"
#This Command to add new user pet-clinic
if id "$User" >/dev/null; then
    echo "User exists"

else
    sudo useradd -m $User
    sudo passwd $User
    sudo id $User
   
fi

if ! /home/saad/jdk-22.0.1/bin/java --version &> /dev/null; then
	cd $java_home
	wget $jdk_url
	tar -zxvf "/home/$User/jdk-22_linux-x64_bin.tar.gz"
    echo 'export PATH="$PATH:/home/saad/jdk-22.0.1/bin"' >> /home/$User/.bashrc
else

	echo " Java exists "
	
fi










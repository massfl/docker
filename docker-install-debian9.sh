#############bash script to install docker in debian9 OS###################
#
#
#!/bin/bash


# SET UP THE DOCKER REPOSITORY
apt update
## install packages to allow apt to use a repository over https
apt install \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
software-properties-common

##add docker's official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -


echo $(date) "the docker install key fingerprint should be: 
        9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
        as specified in https://docs.docker.com/install/linux/docker-ce/debian" \
        > docker-install-key-fingerprint.txt && echo$(apt-key fingerprint 0EBFCD88) >> docker-install-key-fingerprint.txt

## install lsb_release
apt install lsb


##set up the stable docker repository in apt
add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
         $(lsb_release -cs) \
         stable"

#INSTALL DOCKER
apt install docker-ce docker-ce-cli containerd.io \


#send a message to notify that the install if done
&& echo docker install done... check it out with: docker run hello-world




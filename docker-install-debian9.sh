#############bash script to install docker-ce engien and docker-compose in debian9 OS###################
#
#
#!/bin/bash

echo "@@@@@@ Starting DOCKER-CE engine install @@@@@@"


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
        > docker-install-key-fingerprint.txt && echo $(apt-key fingerprint 0EBFCD88) >> docker-install-key-fingerprint.txt

## install lsb_release
apt install lsb


##set up the stable docker repository in apt
add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
         $(lsb_release -cs) \
         stable"

#INSTALL DOCKER
apt install docker-ce docker-ce-cli containerd.io \


#DOCKER COMPOSE INSTALL

echo "@@@@@@ now moving on to DOCKER-COMPOSE install @@@@@@"

##download the current stable release of Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#make the docker compose release file executable
chmod +x /usr/local/bin/docker-compose


#send a message to notify that the install is done
echo "@
@                                                                                                                 @
@                                                                                                                 @
@@@@@    docker-ce engine & docker-compose install done... check it out by running: docker run hello-world    @@@@@"


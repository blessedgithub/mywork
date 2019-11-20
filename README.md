git clone https://github.com/olawale241/mywork.git

## ENSURE DOCKER IS INSTALLED AND SERVICE IS RUNNING ON THE CONTAINER SERVER 



## Copy these 3 files to docker server to build nodejs image application

scp Dockerfile DOCKERSERVER:/work/directory

scp package.json DOCKERSERVER:/work/directory

scp server.js DOCKERSERVER:/work/directory




## Create nodejs image with the dockerfile  

cd /work/directory
docker build -t simplifi_olawale/nodejs .





## on CHEF WORKSTATION , ensure the knife.rb is poiniting to the chef-server and cookbook path is set

Copy the 2  cookbooks downloaded from the git clone earlier (docker and mydocker) 

*docker    #####dependency for mydocker 

*mydocker 




##   Then upload cookbook to the chef server 

knife cookbook upload mydocker

knife cookbook upload docker

## ADD THE COOKBOOK TO THE node(client) in 

knife node run_list remove node1.identity.lsloyalty.com ''recipe[mydocker]'''   ## change node1 to client name please 

knife node run_list remove node1.identity.lsloyalty.com ''recipe[docker]''      ## change node1 to client name please


## ON THE NODE CLIENT where docker is installed and running 

chef-client -o recipe[mydocker]

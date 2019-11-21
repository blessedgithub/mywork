I chose to use centos 7 linux flavor. Separated functionality of all 3 nodes.

    1 Node serving docker services (Chef client)
    
    2 Chef work station 
    
    3 Chef server .

Please change the below in the directory ~/mywork/mydocker/files/nginx/nginx.conf 

192.168.1.179 to the IP of the server running docker service 



## STEP 1

##Download the codes and necessary files using the link below 

git clone https://github.com/olawale241/mywork.git

##ENSURE DOCKER IS INSTALLED AND SERVICE IS RUNNING ON THE CONTAINER SERVER 



##Copy these 3 files to docker server to build nodejs image application

scp Dockerfile DOCKERSERVER:/work/directory

scp package.json DOCKERSERVER:/work/directory

scp server.js DOCKERSERVER:/work/directory




##Create nodejs image with the dockerfile  

cd /work/directory

docker build -t simplifi_olawale/nodejs .





## STEP 2 

##on CHEF WORKSTATION , ensure the knife.rb is poiniting to the chef-server and cookbook path is set

Copy the 2  cookbooks downloaded from the git clone earlier (docker and mydocker) 

*docker    #####dependency for mydocker 

*mydocker 




## STEP 3

##Then upload cookbook to the chef server 

knife cookbook upload mydocker

knife cookbook upload docker

##
## STEP 4 

##ADD THE COOKBOOK TO THE node(client) in 

knife node run_list remove node1.identity.lsloyalty.com ''recipe[mydocker]'''   ## change node1 to client name please 

knife node run_list remove node1.identity.lsloyalty.com ''recipe[docker]''      ## change node1 to client name please


##
## STEP 5

##ON THE NODE CLIENT where docker is installed and running 

chef-client -o recipe[mydocker]

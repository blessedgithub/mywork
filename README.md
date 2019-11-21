I chose to use centos 7 linux flavor. Separated functionality of all 3 nodes.

    1 Node serving docker services (Chef client)
    
    2 Chef work station 
    
    3 Chef server .

Please change the below in the directory ~/mywork/mydocker/files/nginx/nginx.conf 

192.168.1.179 to the IP of the server running docker service 



## STEP 1

## Download the codes and necessary files using the link below 

git clone https://github.com/olawale241/mywork.git

##ENSURE DOCKER IS INSTALLED AND SERVICE IS RUNNING ON THE CONTAINER SERVER 

## STEP 2

## Copy these 3 files to docker server to build nodejs image application

scp Dockerfile DOCKERSERVER:/work/directory

scp package.json DOCKERSERVER:/work/directory

scp server.js DOCKERSERVER:/work/directory

## STEP 3


## Create nodejs image with the dockerfile  

cd /work/directory

docker build -t simplifi_olawale/nodejs .



## STEP 4

## ON CHEF WORKSTATION , ENSURE KNIFE.RB IS POINTING TO YOUR CHEF SERVER AND COOKBOOK PATH IS SET 

Copy the 2  cookbooks downloaded from the git clone earlier (docker and mydocker) 

*docker    #####dependency for mydocker 

*mydocker 




## STEP 5

## UPLOAD COOKBOOK TO CHEF SERVER  

knife cookbook upload mydocker

knife cookbook upload docker

##
## STEP 6

##ADD THE COOKBOOK TO THE node(client) in 

knife node run_list remove node1.identity.lsloyalty.com ''recipe[mydocker]'''   ## change node1 to client name please 

knife node run_list remove node1.identity.lsloyalty.com ''recipe[docker]''      ## change node1 to client name please


##
## STEP 7

##ON THE NODE CLIENT where docker is installed and running 

chef-client -o recipe[mydocker]

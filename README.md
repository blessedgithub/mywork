git clone https://github.com/olawale241/mywork.git



## Copy these 3 files to docker server  
scp Dockerfile DOCKERSERVER:/work/directory

scp package.json DOCKERSERVER:/work/directory

scp server.js DOCKERSERVER:/work/directory




## Create nodejs image with the dockerfile  

cd /work/directory
docker build -t simplifi_olawale/nodejs .





## on CHEF WORKSTATION  
Copy the cookbooks cloned earlier to cookbook path in knife.rb 

*docker    #####dependency for mydocker 

*mydocker 




##   Then upload cookbook to the chef server 

knife cookbook upload mydocker

ADD THE COOKBOOK TO THE node(client) in 

knife node run_list add node1 ''recipe[COOKBOOK::mydocker]''

## ON THE NODE CLIENT 

chef-client 

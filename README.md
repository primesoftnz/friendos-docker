# friendup-docker

Install docker (ubuntu): https://docs.docker.com/engine/install/ubuntu/             
Post install setting (linux only): https://docs.docker.com/engine/install/linux-postinstall/                
docker-composer install: https://docs.docker.com/compose/install/               
                 
<code>git clone https://gitlab.serveit.co.nz/primesoftnz/friendup-docker.git</code>           
<code>cd friendup-docker</code>        
<code>git clone https://github.com/FriendUPCloud/friendup</code>          
<code>git clone https://github.com/FriendSoftwareLabs/presence</code>         
<code>git clone https://github.com/FriendSoftwareLabs/friendchat</code>           
<code>docker-compose up --build</code>      

NOTE: Add <code>myfriendup.com</code> and <code>friendchat</code> in /etc/hosts            
     
## Useful project info:
All settings files can be found in <code>./docker/</code> folder, inside folder, everything is split per app/dependency. (research folder)         
                     
Database data is persistent and is stored in folder <code>./db-data/</code> which will be created once when mariadb container is built.        
                           
Project entrypoint is <code>./docker-compose.yml</code> file which explain a little bit about how each container is build, if it is image or build from file, which file, which folder is mounted where and so on (a little bit more research) :)        
        
## Useful docker commands:     
### STARTING PROJECT      
Start and build/rebuild project: <code>docker-compose up --build</code>       
Start project: <code>docker-compose up</code>      
Start project in background, use <code>-d</code> argument eg. <code>docker-compose up --build -d</code>        
               
### STOP PROJECT       
Stop containers can be used <code>CTRL-C</code> but it doesn't remove containers, containers can be removed manually or by running command below       
Stop containers from project directory: <code>docker-compose down</code>        
        
### USING DOCKER cli    
List running docker containers: <code>docker container ls</code> or shortcut <code>docker ps</code>    
List all docker containers: <code>docker container ls -a</code> or shortcut <code>docker ps -a</code>              
Remove docker container: <code>docker container rm [<container_id>|<container_name>]</code> or shortcut <code>docker rm [<container_id>|<container_name>]</code>       
Force remove container: <code>docker container rm -f [<container_id>|<container_name>]</code> or shortcut <code>docker rm -f [<container_id>|<container_name>]</code>                     
                   
List docker images: <code>docker image ls</code>            
List docker images with all layers: <code>docker image ls -a</code>      
Remove docker images: <code>docker image rm [<image_id>|<image_name>]</code> (can be multiple containers id id id)       
              
Print logs from container to console (last few lines): <code>docker logs [<container_id>|<container_name>]</code>       
Print logs from container to console (and keep printing): <code>docker logs -f [<container_id>|<container_name>]</code>              

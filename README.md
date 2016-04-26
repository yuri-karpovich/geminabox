Docker Geminabox image
=================

This is a Debian based image with [Geminabox](https://github.com/geminabox/geminabox) listening on port 9292. 

Quickstart
----------
	
	docker run -d -p 9292:9292 --name geminabox spoonest/geminabox:latest

By default, there is no authentication on **upload**. To enable it pass variable environment:

	docker run -d -p 9292:9292 -P -h geminabox --name geminabox -e USERNAME=myuser -e PASSWORD=mypassword spoonest/geminabox:latest

If you need private repository with restricted access add `PRIVATE=true` variable.

	docker run -d --name geminabox -e RUBYGEMS_PROXY=true -e PRIVATE=true -v /home/spoonest/Documents/Projects/PrivateGemRepo/gems:/webapps/geminabox/data -p 9292:9292 -P -h geminabox -e USERNAME=myuser -e PASSWORD=mypassword spoonest/geminabox:latest

If you need to enter in the app, use docker exec since Docker 1.3 https://github.com/ahmet2mir/docker-memo

    docker exec -it geminabox /bin/bash

Then visit http://localhost:9292

Configuration
-------------

### Data Store and persistent storage

* packages: mount to /webapps/geminabox/data
* config: mount to /webapps/geminabox/config.ru

If you mount data, when you stop, destroy your container and then run it, data are preserved.

### Password and user

If you wan't to use different configuration for authentication, mount config folder containing your own config.ru
Check [Geminabox Wiki](https://github.com/geminabox/geminabox/wiki/Http-Basic-Auth)

### Logs

Output are in docker log collect 
	
	docker logs -f geminabox

-f like tail -f

### Thanks
Thanks [ahmet2mir](https://github.com/ahmet2mir) for this image.



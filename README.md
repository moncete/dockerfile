# Estado Ejecucion
![pipeline status](http://integra.mon.es/dockerfile/centos/badges/master/pipeline.svg)

# centos

Dockerfile img centos


# Creación Docker Registry:
  Create new registry with diferent port because port 5000 is already in use
  docker volume create 
  docker run -d -p 4000:4000 --restart=always --name registry -v /registry:/var/lib/registry registry:2
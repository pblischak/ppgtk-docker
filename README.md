# Dockerfile for generating PPGtk image

## Obtaining and running the Docker container

```
# Pull the image
docker pull pblischak/ppgtk
```

## Creating a Docker Machine with access to multiple cores

```
docker-machine create --driver virtualbox --virtualbox-cpu-count <#cpus> <new-machine-name>
```

So, for example, if you wanted to create a new machine called `multicore` with access to 4 CPUs you would run:

```
docker-machine create --driver virtualbox --virtualbox-cpu-count 4 multicore
```

After you run this, part of the output will tell you to run this command:

```
docker-machine env multicore
```

This tells you how to set the Docker Environment variables to use the `multicore` machine that you just made.
To switch Docker from the `default` machine, just run:

```
eval $(docker-machine env multicore)
```

## Running the PPGtk image in a container

You can share a local folder with the PPGtk image using the `-v` flag. The `$(pwd)` will choose the current working directory as the one to share, so place all of your data and configuration files within this folder.

```
docker run -it -v $(pwd):/home/analysis pblischak/ppgtk
```

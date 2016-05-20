# Dockerfile for generating PPGtk image

## Obtaining and running the Docker container

```
# Pull the image
docker pull pblischak/ppgtk
```

## Creating a Virtual Machine with access to multiple cores

```
docker-machine --driver virtualbox --virtualbox-cpu-count <#cpus> multicore
```

So, for example, if you wanted to use 4 CPUs you would run:

```
docker-machine --driver virtualbox --virtualbox-cpu-count 4 multicore
```

After you run this part of the output will tell you to run this command:

```
docker-machine env multicore
```

This tells you how to set the Docker Environment variables to use the `multicore` machine that you just made.
To switch Docker from the `default` machine, just run:

```
eval $(docker-machine env multicore)
```

## Running the PPGtk image in a container

```
docker run -it -v /Users/paulblischak/ppgtk-analyses/run1:/home/analysis pblischak/ppgtk
```

# Sbt Docker Container

This is a docker container to run the scala build tool ([sbt](https://www.scala-sbt.org/)).

## Building the Container

to run `sbt` on any machine without installing it just build a docker container and run it with docker

```
docker build -t sbt .
```

## Running the container:

If the container is run with the parameter `-u` the current user id and group id is used to create all files generated by sbt. Otherwise all the files would belong to the root user. With this addition the docker container can be used as if the sbt was run by the user.

```
docker run --rm -it -v $PWD:/sbt -v $HOME:/cache -u $(id -u):$(id -g) sbt
```

If you want to handle sbt like the locally installed version you could just define an alias in your `~/.profile` or wherever you like:

```
alias sbt="docker run --rm -it -v $PWD:/sbt -v $HOME:/cache -u \$(id -u):\$(id -g) sbt"
```

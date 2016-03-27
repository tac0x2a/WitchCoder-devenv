# judgesv_devenv
Environment for developing online judge server.

[View on DockerHub](https://hub.docker.com/r/tac0x2a/judgesv_devenv/).


## Creat Image

```
$ docker build .
```

or

```
$ docker-compose build
$ docker-compose pull
$ docker-compose up -d
```

### for OSX
```
sudo chmod 0755 ./data/mongodb
sudo chown $USER ./data/mongodb
```

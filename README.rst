drone-fabric
=============

Drone.io plugin to execute fabric tasks

Overview
--------

Use Drone Fabric plugin to execute fabric tasks

The following parameters are used to configuration:

* **fab_args** command line options for fab tool

Put the sample configuration in your **.drone.yml** file:

```yaml
workspace:
  base: /build
  path: src

pipeline:
  deploy:
    image: diegotolentino/drone-fabric
    fab_args: -i /build/src/conf/id_rsa --ssh-config-path /build/src/conf/config deploy
```

And you can extend docker image to configure ssh, to do this add the folow lines to your **Dockerfile**:

```
FROM diegotolentino/drone-fabric

ARG SSH_KEY
ARG SSH_CONFIG

RUN mkdir /root/.ssh/
RUN echo "$SSH_KEY" > /root/.ssh/id_rsa
RUN echo "$SSH_CONFIG" > /root/.ssh/config

ENTRYPOINT ["/drone-fabric/run.sh"]
```

And run the build img

```
$ docker build --rm=true -t custom-docker-fabric --build-arg SSH_KEY="$(cat ~/.ssh/id_rsa)" --build-arg SSH_CONFIG="$(cat ~/.ssh/config)" .
```

Now you can configure your **.drone.yml** file as:

```yaml
workspace:
  base: /build
  path: src

pipeline:
  deploy:
    image: custom-docker-fabric
    fab_args: deploy
```


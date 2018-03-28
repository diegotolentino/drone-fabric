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

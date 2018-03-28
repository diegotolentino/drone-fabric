# docker build --rm=true -t diegotolentino/drone-fabric .

FROM python:2.7.14

RUN pip install Fabric==1.14.0

RUN mkdir /drone-fabric/
COPY run.sh /drone-fabric/

ENTRYPOINT ["/drone-fabric/run.sh"]

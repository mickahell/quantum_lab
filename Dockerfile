FROM ubuntu:18.04

# Choose your quantum env
ARG script=qml.sh
#ARG script=qiskit.sh

RUN apt-get update -yq \
&& apt-get install python3.8 -y \
&& apt-get install python3-pip -y \
&& apt-get clean -y

RUN pip3 install numpy \
&& pip3 install networkx \
&& pip3 install matplotlib \
&& pip3 install notebook

RUN /build/${script}

ADD . /data
WORKDIR /data

VOLUME /data

CMD /bin/bash

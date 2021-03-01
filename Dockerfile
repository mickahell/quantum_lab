FROM ubuntu:18.04

# Choose your quantum env
script=qml.sh
#script=qiskit.sh

RUN apt-get update -yq \
&& apt-get install python3.8 \
&& apt-get install python3-pip \
&& apt-get clean -y

RUN pip install numpy \
&& pip install networkx \
&& pip install matplotlib \
&& pip install notebook

RUN /build/${script}

ADD . /data
WORKDIR /app

VOLUME /data

CMD /bin/bash

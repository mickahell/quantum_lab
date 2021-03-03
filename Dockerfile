FROM ubuntu:18.04

# Choose your quantum env
#ARG quantum_env=qiskit.sh
ARG quantum_env=qml_requirements.txt

RUN apt-get update -yq \
&& apt-get install python3.8 -y \
&& apt-get install python3-pip -y \
&& apt-get install git -y \
&& apt-get clean -y

ADD build/* /build/
ADD data/* /data/

RUN pip3 install -r /build/requirements.txt
RUN pip3 install -r /build/${quantum_env}

WORKDIR /data
VOLUME /data

CMD /bin/bash

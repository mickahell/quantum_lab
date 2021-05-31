FROM ubuntu:18.04

# Choose your quantum env
ARG quantum_env
#ARG quantum_env=qiskit.sh
#ARG quantum_env=qml.sh
#ARG quantum_env=qsharp.sh
#ARG quantum_env=simulaqron.sh
#ARG quantum_env=myqlm.sh
#ARG quantum_env=cirq.sh

# Var for labels
ARG GITHUB_ACTOR
ARG GITHUB_REPOSITORY
ARG GITHUB_REF

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

LABEL org.opencontainers.image.title="Quantum Lab" \
      org.opencontainers.image.authors=${GITHUB_ACTOR} \
      org.opencontainers.image.vendor=${GITHUB_REPOSITORY} \
      org.opencontainers.image.source="https://github.com/mickahell/quantum_lab" \
      org.opencontainers.image.url="https://github.com/mickahell/quantum_lab/tags" \
      org.opencontainers.image.description="Docker image for quantum algorythm" \
      org.opencontainers.image.documentation="https://github.com/mickahell/quantum_lab/blob/main/README.md" \
      org.opencontainers.image.os="Ubuntu Bionic" \
      org.opencontainers.image.version=${GITHUB_REF}
      
# OS requirements
RUN apt-get update -yq \
&& apt-get install python3.8 -y \
&& apt-get install python3-pip -y \
&& apt-get install python3-tk -y \
&& apt-get install vim -y \
&& apt-get install wget -y \
&& apt-get clean -y

# Add script & data
ADD build/* /opt/quantum_lab/build/
ADD data/* /opt/quantum_lab/data/

# General & env requirements
RUN pip3 install --upgrade pip setuptools
RUN pip3 install -r /opt/quantum_lab/build/requirements.txt
RUN /opt/quantum_lab/build/${quantum_env}

WORKDIR /opt/quantum_lab/data
VOLUME /opt/quantum_lab/data/share

CMD /bin/bash

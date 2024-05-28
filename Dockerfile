FROM mickahell/qatcomputer-full:latest

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
      org.opencontainers.image.os="Ubuntu Focal" \
      org.opencontainers.image.version=${GITHUB_REF}
      
# OS requirements
RUN apt-get update -yq \
&& apt-get install python3-tk -yq \
&& apt-get dist-upgrade -yq \
&& apt-get clean -yq

# Add script & data
ADD build/* /opt/quantum_lab/build/
ADD data/ /opt/quantum_lab/data/
ADD start_jupyter.sh /opt/quantum_lab/

# General & env requirements
RUN pip install --upgrade pip setuptools
RUN pip install -r /opt/quantum_lab/build/requirements.txt

WORKDIR /opt/quantum_lab/data
VOLUME /opt/quantum_lab/data/share

EXPOSE 8888

CMD /bin/bash

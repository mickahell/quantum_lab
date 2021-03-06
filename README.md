# Quantum Lab
[![Docker Image CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml)

## Prerequisites
- <details><summary>Linux</summary>
  <pre>apt-get install docker-ce docker-ce-cli containerd.io</pre>
</details>

- <details><summary>Mac / Windows</summary>
  https://www.docker.com/products/docker-desktop
</details>

## Details
- The image is base on Ubuntu [Bionic](https://doc.ubuntu-fr.org/bionic) (Will be updated to the next LTS)
- Python version install : [3.8](https://www.python.org/downloads/release/python-383/)

## Getting started & Simple docker commands
- To build the image, run the following command line : `docker build -t quantum_lab .`
- To create a new containeur and go inside : `docker run -it -v $(pwd)/data:/data --entrypoint=/bin/bash -p 8888:8888 quantum_lab`
- To go inside a started containeur : `docker exec -it -u root [CONTAINEUR_ID] /bin/bash`
- To start a containeur : `docker start [CONTAINEUR_ID]`
- See the existed containeur : `docker ps -a`
  - The `-a` is used the see every existed containeurs, that's include the stopped one
- List the images existed : `docker images`
- Delete containeur : `docker rm [CONTAINEUR_ID]`
- Delete image : `docker rmi [NAME_OF_THE_IMAGE]`
  - You can use `-f` to force the suppression and delete the containeurs associates to the image

### Environment
- Libs common for every env : ```networkx, numpy, matplotlib, notebook, pandas, scipy```
- 2 lib setup are available, one for installating [PennyLane](https://pennylane.ai) and the other one for using [Qiskit](https://qiskit.org)
  - `qml.sh`
    - Libs : ```autograd, pennylane, pennylane-sf, pennylane-qiskit```
  - `qiskit.sh`
    - Libs : ```qiskit, qiskit[visualization]```

To use one of this, set the right variable at the beginning of the `Dockerfile`

### Volume
The folder `data` is link to the host file and allow to register the modification in the host computer

### Jupyter
To launch the Jupyter notebook instance, run `jupyter notebook`
- http://127.0.0.1:8888/

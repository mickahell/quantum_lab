# Quantum Lab
[![Docker Image CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml)
[![Docker TAG CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-tag.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-tag.yml)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mickahell/quantum_lab)](https://github.com/mickahell/quantum_lab/releases)

[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qiskit?label=Quantum%20Lab%20Qiskit&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qiskit)
[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qml?label=Quantum%20Lab%20QML&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qml)
[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qsharp?label=Quantum%20Lab%20Q%23&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qsharp)

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

## Getting started
- Build the image, run the following command line : <pre>docker build --build-arg quantum_env=qiskit.sh -t quantum_lab .</pre>
  - You can replace `qiskit.sh` with the following one `qml.sh`or `qsharp.sh`
- To create a new containeur and go inside, run the script : `./start.sh`

### Environment
- Libs common for every env : ```networkx, numpy, matplotlib, notebook, pandas, scipy, tk, vim```
- 3 lib setup are available, one for installating [PennyLane](https://pennylane.ai), one for using [Qiskit](https://qiskit.org) and one for using [Q#](https://azure.microsoft.com/fr-fr/resources/development-kit/quantum-computing/)
  - `qml.sh`
    - Libs : ```autograd, pennylane, pennylane-sf, pennylane-qiskit```
  - `qiskit.sh`
    - Libs : ```qiskit, qiskit[visualization]```
  - `qsharp.sh`
    - Libs : ```qsharp, iqsharp```

### Volume
The folder `data` is link to the host file and allow to register the modification in the host computer

### Jupyter
To launch the Jupyter notebook instance :
- be inside the `data`folder
- run : `./start_jupyter.com`
- copy and paste this url in your browser : `http://127.0.0.1:8888/`

## Simple docker commands
- To go inside a started containeur : `docker exec -it -u root [CONTAINEUR_ID] /bin/bash`
- To start a containeur : `docker start [CONTAINEUR_ID]`
- See the existed containeur : `docker ps -a`
  - The `-a` is used the see every existed containeurs, that's include the stopped one
- List the images existed : `docker images`
- Delete containeur : `docker rm [CONTAINEUR_ID]`
- Delete image : `docker rmi [NAME_OF_THE_IMAGE]`
  - You can use `-f` to force the suppression and delete the containeurs associates to the image

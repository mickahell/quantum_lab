# Quantum Lab
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
[![DOI](https://zenodo.org/badge/343446026.svg)](https://zenodo.org/badge/latestdoi/343446026)  
[![Docker Image CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml)
[![Docker TAG CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-tag.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-tag.yml)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mickahell/quantum_lab)](https://github.com/mickahell/quantum_lab/releases)

[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qiskit?label=Quantum%20Lab%20Qiskit&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qiskit)
[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qml?label=Quantum%20Lab%20QML&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qml)
[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qsharp?label=Quantum%20Lab%20Q%23&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qsharp)
[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_myqlm?label=Quantum%20Lab%20myQLM&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_myqlm)
[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_simulaqron?label=Quantum%20Lab%20SimulaQron&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_simulaqron)

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
  - You can replace `qiskit.sh` with the following one `qml.sh`, `qsharp.sh`, `simulaqron.sh` or `myqlm.sh`
- To create a new containeur and go inside, run the script : `./start.sh`

### Environment
- Libs common for every env : ```networkx, numpy, matplotlib, notebook, pandas, scipy, tk, vim```
- 4 libs setup are available, one for installating [PennyLane](https://pennylane.ai), one for using [Qiskit](https://qiskit.org), one for using [Q#](https://azure.microsoft.com/fr-fr/resources/development-kit/quantum-computing/), one for [SimulaQron](https://softwarequtech.github.io/SimulaQron/html/GettingStarted.html) and one for [myQLM](https://atos.net/en/lp/myqlm)
  - `qml.sh`
    - Libs : ```autograd, pennylane, pennylane-sf, pennylane-qiskit```
  - `qiskit.sh`
    - Libs : ```qiskit, qiskit[visualization]```
  - `qsharp.sh`
    - Libs : ```qsharp, iqsharp```
  - `simulaqron.sh`
    - Libs : ```simulaqron```
  - `myqlm.sh`
    - Libs : ```myqlm, libmagickwand-dev, myqlm-interop[qiskit_binder]```

### Volume
The folder `data/share` is link to the host file and allow to register the modification in the host computer

### Jupyter
To launch the Jupyter notebook instance :
- be inside the `data`folder
- run : `./start_jupyter.sh`
- copy and paste this url in your browser : `http://127.0.0.1:8888/`

## Simple docker commands
- List the existed images : `docker images`
- List the existed containeur : `docker ps -a`
  - The `-a` is used the see every existed containeurs, that's include the stopped one
- To start a containeur : `docker start [CONTAINEUR_ID]`
- To go inside a started containeur : `docker exec -it -u root [CONTAINEUR_ID] /bin/bash`
- Delete containeur : `docker rm [CONTAINEUR_ID]`
- Delete stopped container : `docker container prune`
- Delete image : `docker rmi [NAME_OF_THE_IMAGE]`
  - You can use `-f` to force the suppression and delete the containeurs associated to the image
- List the existed volume : `docker volume ls`
- Delete volume not used anymore : `docker volume prune`

## Cite as
If you use my work, please cite as : <pre>Quantum Lab: Docker image for quantum laboratory, Michaël Rollin, 2021, DOI: <a href=https://doi.org/10.5281/zenodo.4664195>10.5281/zenodo.4664195</a></pre>

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/mickahell"><img src="https://avatars.githubusercontent.com/u/20951376?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Mica</b></sub></a><br /><a href="#tutorial-mickahell" title="Tutorials">✅</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
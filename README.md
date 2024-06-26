# Quantum Lab
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
[![DOI](https://zenodo.org/badge/343446026.svg)](https://zenodo.org/badge/latestdoi/343446026)  
[![Docker Image CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-image.yml)
[![Docker TAG CI](https://github.com/mickahell/quantum_lab/actions/workflows/docker-tag.yml/badge.svg)](https://github.com/mickahell/quantum_lab/actions/workflows/docker-tag.yml)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mickahell/quantum_lab)](https://github.com/mickahell/quantum_lab/releases)

[![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qiskit?label=Quantum%20Lab%20Qiskit&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qiskit)

__The next images are now depreciated, please use the Qiskit one just above.__
- <details><summary>Old images</summary>

  [![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qiskit-full?label=Quantum%20Lab%20Qiskit-full&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qiskit-full)
  [![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qml?label=Quantum%20Lab%20QML&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qml)
  [![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_qsharp?label=Quantum%20Lab%20Q%23&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_qsharp)
  [![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_myqlm?label=Quantum%20Lab%20myQLM&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_myqlm)
  [![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_simulaqron?label=Quantum%20Lab%20SimulaQron&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_simulaqron)
  [![Docker Pulls](https://img.shields.io/docker/pulls/mickahell/quantum_lab_cirq?label=Quantum%20Lab%20Cirq&style=for-the-badge)](https://hub.docker.com/r/mickahell/quantum_lab_cirq)

</details>

## Prerequisites
- <details><summary>Linux</summary>
  <pre>apt-get install docker-ce docker-ce-cli containerd.io</pre>
</details>

- <details><summary>Mac / Windows</summary>
  https://www.docker.com/products/docker-desktop
</details>

## Details
- The image is based on [qat-computer](https://github.com/mickahell/qat-computer).

## Getting started
#### Build

```bash
docker build . --file Dockerfile --tag quantum_lab_qiskit
```

#### Run

```bash
docker run -d --name qiskit_lab \
  -v $PWD/YOUR_DATA_FOLDER:/opt/quantum_lab/data/share \
  -p 8888:8888 \
  mickahell/quantum_lab_qiskit:latest /opt/quantum_lab/start_jupyter.sh
```
- copy and paste this url in your browser : `http://127.0.0.1:8888/` to open the jupyter interface.
- everyfile in the share folder gonna be sync with your local volume.

### Volume
The folder `data/share` is link to the host file and allow to register the modification in the host computer

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
    <td align="center"><a href="https://github.com/mickahell"><img src="https://avatars.githubusercontent.com/u/20951376?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Mica</b></sub></a><br /><a href="https://github.com/mickahell/quantum_lab/commits?author=mickahell" title="Code">💻</a> <a href="https://github.com/mickahell/quantum_lab/commits?author=mickahell" title="Documentation">📖</a></td>
    <td align="center"><a href="https://www.linkedin.com/in/albertomaldonadoromo/"><img src="https://avatars.githubusercontent.com/u/21325664?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Alberto Maldonado</b></sub></a><br /><a href="https://github.com/mickahell/quantum_lab/pulls?q=is%3Apr+reviewed-by%3AMaldoAlberto" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

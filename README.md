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
- The image is base on Ubuntu [Bionic](https://doc.ubuntu-fr.org/bionic) (Will be updated to next LTS)
- Python version install : 3.8

## Starting the image
To start the image, run the following command line :
`docker build -t quantum_lab .`

### Environment
- Libs common for every env : ```networkx, numpy, matplotlib, notebook, qutip```
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

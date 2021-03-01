# Quantum Lab

## Starting the image
To start the image, run the following command line :
`docker build -t quantum_lab .`

### Environment
- 2 lib setup are available, one for installating [PennyLane](pennylane.ai) and the other one for using [Qiskit](qiskit.org)
  - `qml.sh`
  - `qiskit.sh`

To use one of this, set the right variable at the beginning of the `Dockerfile`

### Volume
The folder `data` is link to the host file and allow to register the modification in the host computer

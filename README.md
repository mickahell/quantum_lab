# Quantum Lab

## Starting the image
To start the image, run the following command line :
`docker build -t quantum_lab .`

### Environment
- 2 lib setup are available, one for installating pennylane for qml and the other one for using qiskit
  - `qml.sh`
  - `qiskit.sh`

To use then, set the right variable at the beginning of the `Dockerfile`

### Volume
The folder `data` is link to the host fil and allow to register the modification in the host computer

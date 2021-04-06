#!/bin/bash

apt-get install libmagickwand-dev -y

pip3 install myqlm
python3 -m qat.magics.install

pip3 install myqlm-interop[qiskit_binder]

#!/bin/bash

pip3 install simulaqron

# Getting last version of CQC-Python for quantum network examples
apt-get update
apt-get install git

cd /opt/quantum_lab/data/simulaqron
git clone https://github.com/SoftwareQuTech/CQC-Python.git

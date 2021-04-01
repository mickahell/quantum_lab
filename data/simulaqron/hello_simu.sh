#!/bin/bash

# Start simulaqron and init qnodes
echo 'yes' | simulaqron start
# Run a simple EPR protocol between Alice and Bob (simple entanglement)
/opt/quantum_lab/data/CQC-Python/examples/pythonLib/corrRNG/run.sh

# Wait time to the ERP finish and then stop and reset nodes
sleep 7
simulaqron stop
echo 'yes' | simulaqron reset

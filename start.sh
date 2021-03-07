#!/bin/bash

docker run -it -v $(pwd)/data:/opt/quantum_lab/data --entrypoint=/bin/bash -p 8888:8888 -e LANG=C.UTF-8 quantum_lab

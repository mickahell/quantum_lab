# Quantum Lab
A simple docker image to simulate a full *Quantum laboratory*

## Abstract
We are at the beginning of the run for the quantum supremacy and quantum independant of the different worldwide government. More and more companies are building their own quantum computer with their own librairy/language. Some of these allow to connect to multiple quantum computers and other are specializes for one type of computer. Also some librairies are very specified for some kind of task like Pennylane for QML. 

For these reason it begans for and more complicated to setup a clear unique environment to develop with each quantum technologies or to switch between each others. This article is about the setup of a simple multi-Docker image, allowing to build a clean environment for each technologies known and a sharable volume to share the content between the host computer and the differents container.

## Table of content
1. [Pre-requisites](#prereqisites)
2. [What's Docker ?](#docker)
3. [How does it work](#working)  
	3.1. [Building image](#image)  
	3.2 [Create container](#container)
4. [Annexes](#annexes)
5. [References](#ref)

## Pre-requisites <a class="anchor" id="prereqisites"></a>
First to be able to run the lab, you need to install Docker, that's the only requirement needed :
- <details><summary>Linux</summary>
  <pre>apt-get install docker-ce docker-ce-cli containerd.io</pre>
</details>

- <details><summary>Mac / Windows</summary>
  https://www.docker.com/products/docker-desktop
</details>

## What is Docker <a class="anchor" id="docker"></a>

## How does it work <a class="anchor" id="working"></a>

[SCHEMA]

Download the code : **[Github](https://github.com/mickahell/quantum_lab)**

The role of the image is to simulate a virtual environment as a Quantum lab for a specialize library/language. Another need is to synchonize the data between the container of the host computer.
Like this, we could develop our code on our favorite IDE on our classical computer and run the code directly in the container.

### Build the image <a class="anchor" id="image"></a>
First we need to build the image, we have to generate a docker image from our `Dockerfile` by using : 
<pre>docker build --build-arg quantum_env=qiskit.sh -t quantum_lab .</pre>
Feel free to replace `qiskit.sh` with `qml.sh`or `qsharp.sh`. That'll setup a specialize environment for of this library/language. This command can take several minute, do not stop it until the command gave back you the hand.

#### Pre build images
Pre build images for each environment are available in the [Docker Hub] :
- `quantum_lab_qiskit`
- `quantum_lab_qml`
- `quantum_lab_qsharp`

You can download them by using : `docker pull mickahell/[IMAGE_NAME]` (ex. `quantum_lab_qiskit`)  
To not have any problem with the following tutorial I suggest you to rename the image as `quantum_lab` by using : <pre>docker image tag mickahell/[IMAGE_NAME]:latest quantum_lab:latest</pre>

### Create container <a class="anchor" id="container"></a>
Now we have our image `quantum_lab`, you can see it by taping `docker images`. Next we need to setup a container who we be our virtual environment. We can create as much container as the stockage of our computer allows it.

#### Volume
To sync data between the container and the host computer we need to create a volume, by default in the image a simple volume is create between the default docker sharing folder of the host and the `/opt/quantum_lab/data` folder. To make things easier we can specified which folder of our host we want to sync by using `-v [YOUR_FOLDER]:/opt/quantum_lab/data` during the creation of the container.

#### Jupyter
In each environment Jupyter notebook is available, to synchronize it with our host browser we need to sync port network to do this just use the option `-p 8888:8888` in the container creation. Then a script allow you to start a Jupyter server : `/opt/quantum_lab/data/start_jupyter.sh`. Finally just go in your browser and tap : `http://127.0.0.1:8888/`


### Run everything together
Finally to create our container and to be allow to use volume sync and jupyter you can use this simple command line :
<pre>docker run -it -v $(pwd)/data:/opt/quantum_lab/data --entrypoint=/bin/bash -p 8888:8888 -e LANG=C.UTF-8 quantum_lab</pre>

## Futur
We are at the very beginning of the quantum era so that means the alrealdy installed quantum technologies will have updated very often and more and more libraries and languages will be coming soon. So the image will be updated as often as possible and more environment will be soon available as new option.

The goal is to make everything possible to keep the image as simple as possible to use and to setup. Pre build image are already available in the [Docker Hub](https://hub.docker.com/), allowing to just download the image and create container, so no need to clone the project and build entirely the images anymore.

If you have an idea of features do not hesitate and create an **[issue](https://github.com/mickahell/quantum_lab/issues/new)**.

## Annexes
### Environment detailes
- Libs common for every env : ```networkx, numpy, matplotlib, notebook, pandas, scipy, tk, vim```
- 3 lib setup are available, one for installating [PennyLane](https://pennylane.ai), one for using [Qiskit](https://qiskit.org) and one for using [Q#](https://azure.microsoft.com/fr-fr/resources/development-kit/quantum-computing/)
  - `qml.sh`
    - Libs : ```autograd, pennylane, pennylane-sf, pennylane-qiskit```
  - `qiskit.sh`
    - Libs : ```qiskit, qiskit[visualization]```
  - `qsharp.sh`
    - Libs : ```qsharp, iqsharp```

All the libs setup scripts are available in the folder `/opt/quantum_lab/build` inside the image, some of the libs can live together and some cannot (ex. `qiskit` and `pennylane-qiskit` can't).

#### Simulaqron
**COMING SOON !**

### Hello world!
*Hello world* program for each environment are available inside the image in the data folder and allow to test the quantum laboratory.

### Simple docker commands
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

## References <a class="anchor" id="ref"></a>
[1] [Qiskit](https://qiskit.org)  
[2] [Pennylane](https://pennylane.ai)  
[3] [Q#](https://azure.microsoft.com/fr-fr/resources/development-kit/quantum-computing/)  
[4] [Simulaqron]()

## Author
Michaël Rollin, [GitHub](https://github.com/mickahell), [Twitter](https://twitter.com/mickahell89700), [Linkedin](https://www.linkedin.com/in/michaelrollin/)

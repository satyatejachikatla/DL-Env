# DL-Env
How to setup Deep Learning Environment using Docker for
  - tensorflow
  - pytorch

# Prerequisites

  - [Install CUDA and cuDNN](https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html)
  - [Install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
  - [Install NVIDIA container toolkit](https://github.com/NVIDIA/nvidia-docker)

# Installation

Clone the repo

```sh
git clone https://github.com/turrentrock/DL-Env
```

For pytorch-env, need additional changes to "pytorch_env/start.sh".
Add the respective entries. Also can change the repo name directly if required.
```sh
PYTORCH_VERSION=1.4
CUDA_VERSION=10.1
CUDNN_VERSION=7
CONTAINER_REPO=pytorch/pytorch:$PYTORCH_VERSION-cuda$CUDA_VERSION-cudnn$CUDNN_VERSION-devel
```

For tf-env, change the repo name if required.
```sh
CONTAINER_REPO=tensorflow/tensorflow:latest-gpu-py3
```

# Usage
Example for creating new container.
```sh
root@teja:~/DL-Env# bash pytorch_env/start.sh 
Please enter argument : Container name
root@teja:~/DL-Env# bash pytorch_env/start.sh new_container
Container not present. Creating new.
root@fd3c27495506:/workspace#
```
We can use /mnt as common folder between container and host.
```sh
root@fd3c27495506:/workspace# cd /mnt
root@fd3c27495506:/mnt# touch Common changes
root@fd3c27495506:/mnt# ls
Common  changes
root@fd3c27495506:/# python3
Python 3.7.4 (default, Aug 13 2019, 20:35:49) 
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> exit()
root@fd3c27495506:/# exit
exit
root@teja:~/DL-Env# ls pytorch_env/py_torch_sb/
changes  Common
```
For deleting the container.
```sh
root@teja:~/DL-Env# bash pytorch_env/delete.sh new_container
Do you wish to delete this env?(y/n)y
fd3c27495506
root@teja:~/DL-Env# 
```

All the above steps are valid for tf-env as well.
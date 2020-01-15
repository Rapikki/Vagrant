#!/bin/bash

# Installing Docker on an Ubuntu machine
sudo apt-get -y update
sudo apt install -y docker.io
sudo usermod -aG docker $USER

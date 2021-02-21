#!/bin/bash

sudo apt install wget git screen
git clone --single-branch --branch linux64sc-install --depth 1 https://github.com/Bitblazers-lk/AirShareRelease
cd AirShareRelease 
sudo ./install-linux.sh
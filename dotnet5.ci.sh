#!/bin/bash

mkdir sand
cd sand

wget -c -O dotnet-install.sh https://dot.net/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh -c 5.0

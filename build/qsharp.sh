#!/bin/bash

# Installaing .NET
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y apt-transport-https
apt-get install -y dotnet-sdk-3.1
apt-get install -y aspnetcore-runtime-3.1

# Installing Q# and .NET quantum env
pip3 install qsharp
dotnet tool install -g Microsoft.Quantum.IQSharp
/root/.dotnet/tools/dotnet-iqsharp install --user --path-to-tool="/root/.dotnet/tools/dotnet-iqsharp"
export PATH="/root/.dotnet/tools:$PATH"
dotnet iqsharp install

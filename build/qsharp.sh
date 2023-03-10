#!/bin/bash

# Installing .NET
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y apt-transport-https apt-utils
apt-get install -y dotnet-sdk-6.0
apt-get install -y aspnetcore-runtime-6.0
apt-get install -y dotnet-runtime-6.0

# Installing Q# and .NET quantum env
pip3 install qsharp
dotnet tool install -g Microsoft.Quantum.IQSharp
~/.dotnet/tools/dotnet-iqsharp install --user --path-to-tool="~/.dotnet/tools/dotnet-iqsharp"
export PATH="~/.dotnet/tools:$PATH"
dotnet iqsharp install

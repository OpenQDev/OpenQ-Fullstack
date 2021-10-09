#!/bin/bash
. ./colors.sh

cd ./OpenQ-Contracts
yarn deploy:docker
echo -e "Contracts deployed to Hardhat blockchain\n"
#!/bin/bash
. ./colors.sh

cd ./OpenQ-Contracts
yarn deploy:local
echo -e "Contracts deployed to Hardhat blockchain\n"
#!/bin/bash
. ./colors.sh

cd ./contracts
yarn deploy:local
echo -e "Contracts deployed to Hardhat blockchain\n"
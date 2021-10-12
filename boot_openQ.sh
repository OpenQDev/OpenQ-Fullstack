#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

# Grant execution permissions to bootscript
chmod u+x 1_contracts.sh
chmod u+x 2_api.sh
chmod u+x 3_frontend.sh
chmod u+x 4_helm.sh
chmod u+x 5_kubeconfig.sh
chmod u+x 6_github_oauth_server.sh
chmod u+x 7_cert_manager.sh
chmod u+x 8_json_rpc_node.sh
chmod u+x 9_fullstack.sh

./1_contracts.sh
./2_api.sh
./3_frontend.sh
./4_helm.sh
./5_kubeconfig.sh
./6_github_oauth_server.sh
./7_cert_manager.sh
./8_json_rpc_node.sh
./9_fullstack.sh $1
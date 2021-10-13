#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

chmod u+x 1_clone_contracts.sh
chmod u+x 2_clone_api.sh
chmod u+x 3_clone_frontend.sh
chmod u+x 4_clone_helm.sh
chmod u+x 5_clone_kubeconfig.sh
chmod u+x 6_clone_github_oauth_server.sh
chmod u+x 7_clone_cert_manager.sh
chmod u+x 8_clone_json_rpc_node.sh
chmod u+x 9_compose_fullstack.sh

./1_clone_contracts.sh
./2_clone_api.sh
./3_clone_frontend.sh
./4_clone_helm.sh
./5_clone_kubeconfig.sh
./6_clone_github_oauth_server.sh
./7_clone_cert_manager.sh
./8_clone_json_rpc_node.sh
./9_compose_fullstack.sh $1
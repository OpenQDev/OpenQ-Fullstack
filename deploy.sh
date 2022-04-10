#!bin/bash

0. choose environment
- switch to appropriate branch

1. deploy contracts
- 
- deploy block in .env.contracts
- contract addresses in .env.contracts

2. update OpenQ ABIs
Update ABIs
-  Subgraph
- Helm

3. Update block number in Subgraph
- pull from .env.contracts

4. Deploy OZ Autotask
- Remove devDeps

5. Tag and deploy microservices

6. Tag and deploy helm with new config

7. Manually update OpenQ Address Secret in OZ Defender
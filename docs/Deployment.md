# OpenQ Deployment Process

## 1 Deploy Contracts

### 1.1 Prepare .env
- Copy the `.env.[environment]` into `.env`
- Provide private keys for `CLIENT` and `CONTRIBUTOR`

### 1.2 Fund `CLIENT` and `CONTRIBUTOR` Account with MATIC
Use the [Mumbai Polygon Faucet](https://faucet.polygon.technology) to send the following tokens to both `CLIENT` and `CONTRIBUTOR`:

- MATIC Token
- Test ERC20 (PoS)
- LINK

### 1.3 Run Deployment Script for Target Environment

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | `yarn deploy:mumbai`       |
| Staging      | `yarn deploy:polygon`       |
| Production   | `yarn deploy:polygon`        |

__*Note*__: `OPENQ_PROXY_ADDRESS` output to `.env.contracts`

### 1.4 Update OpenQV0 Addresses

There are three places which will need the new OpenQV0 contract address:

#### OpenQ-Graph `config`
- Navigate to [OpenQ Subgraph config](https://github.com/OpenQDev/OpenQ-Graph/tree/main/config)
- Go to `[environment].json`
- Update the `address` with the new address
- Update the `startBlock` with the contract creation block

#### Open Zeppelin Defender Autotask Secret
- Go to [defender.openzeppelin.com](https://defender.openzeppelin.com/)
- Login as admin@openq.dev
- Update the contract address secret for depending on environment

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | `OPENQ_PROXY_ADDRESS_DEVELOPMENT`       |
| Staging      | `OPENQ_PROXY_ADDRESS_STAGING`       |
| Production   | `OPENQ_PROXY_ADDRESS_PRODUCTION`        |

#### OpenQ-Frontend .env.<ENVIRONMENT> file

Updating the OPENQ_PROXY_ADDRESS in the frontend requires rebuilding the image.

- Take `.env.<ENVIRONMENT>.sample` file
- Update `OPENQ_PROXY_ADDRESS` to the new address
- `base64 .env.<ENVIRONMENT>.sample`
- In CircleCI, update the <environment>_env file with the new base64 encoded value

### 1.4 Update OpenQV0 ABI

The updated OpenQV0 ABI will be output to `OpenQ-Contracts/artifacts/contracts/OpenQ/Implementations/OpenQV0.json`

There are two places which will need the new OpenQV0 ABI:

#### [OpenQ-Helm](https://github.com/OpenQDev/OpenQ-Helm/blob/main/abis/OpenQV0.json)
OpenQ-Helm requires the FULL artifact output, including the .

This is because while working locally, the `artifacts` folder from the `OpenQ-Contracts` repository is dynamically loaded into `OpenQ-Frontend` at runtime.

#### [OpenQ Subgraph config](https://github.com/OpenQDev/OpenQ-Graph/tree/main/abis/OpenQ.json)
OpenQ-Subgraph ONLY requires the ABI ARRAY.

Delete any additional Hardhat output

## 2 Verify Contracts

### 2.1 Get a Polygonscan API Key

### 2.2 Add Polygonscan API Key to `.env`

```bash
POLYGON_SCAN_API_KEY=
```

### 2.3 Verify the OpenQ Implementation Contract

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | ``npx hardhat verify OPENQ_IMPLEMENTATION_ADDRESS --network mumbai``       |
| Staging      | ``npx hardhat verify OPENQ_IMPLEMENTATION_ADDRESS --network polygon``       |
| Production   | ``npx hardhat verify OPENQ_IMPLEMENTATION_ADDRESS --network polygon``        |

### 2.4 Verify the OpenQ Proxy Contract on Polygonscan

- Navigate to the contract's page on [Polygonscan](https://polygonscan.com/) or [Polygonscan - Mumbai](https://mumbai.polygonscan.com/)
- Go to the `Contract` tab
- Click `More Options`
- Click `"Is this a proxy?"`
- Verify the address
- Return to the contract's page

## 3 Deploy OpenQ Subgraph

### 3.1 Prepare subgraph.yml

Run `yarn prepare-[environment].yml`, where [environment] is the target environment.

__*Note*__: This will take the values in [`OpenQ-Graph/config/[environment].json`](https://github.com/OpenQDev/OpenQ-Graph/blob/main/config/development.json) and pipe them through [subgraph.yml.mustache](https://github.com/OpenQDev/OpenQ-Graph/blob/main/subgraph.yaml.mustache) to generate the completed `subgraph.yml`.

| Environment      | Prepare Script |
| ----------- | ----------- |
| Local      | `yarn prepare-local`       |
| Development      | `yarn prepare-development`       |
| Staging      | `yarn prepare-staging`       |
| Production   | `yarn prepare-production`        |

### 3.2 Deploy the OpenQ Subgraph

| Environment      | Deploy Script |
| ----------- | ----------- |
| Local      | `yarn deploy-local`       |
| Development      | `yarn deploy-development`       |
| Staging      | `yarn deploy-staging`       |
| Production   | `yarn deploy-production`        |

### 3.3 Confirm Indexing on the Graph Hosted Service

__*Note*__: This may take up to 15 minutes to sync

| Environment      | Subgraph URL |
| ----------- | ----------- |
| Local      | http://localhost:8000/subgraphs/name/openqdev/openq       |
| Development      | https://thegraph.com/hosted-service/subgraph/openqdev/openq-development       |
| Staging      | https://thegraph.com/hosted-service/subgraph/openqdev/openq-staging       |
| Production   | https://thegraph.com/hosted-service/subgraph/openqdev/openq        |

## 4 Release Microservices With Helm

### 4.1 Tag and Push Microservice

We use environment and Semantic Versioning on all our microservices.

Tag them like so:

```bash
git tag <ENVIRONMENT>-<SEMVER>
git push origin <ENVIRONMENT>-<SEMVER>
```

Example:

```bash
git tag development-0.2.0
git push origin development-0.2.0
```

### 4.2 Repeat for each microservice in need of an update

### 4.3 Monitor Build on CircleCI
- Monitor build at https://app.circleci.com/pipelines/github/OpenQDev

## 5 Deploy Helm

### 5.1 Update Tags
- Update image tag at `frontend.image.tag` in the Helm values YAML to match images pushed in step 4

### 5.2 Commit Changes

```bash
git add .
git commit -m "updates OpenQ-Frontend to development-0.3.12, updates OPENQ_PROXY_ADDRESS to 0x994EDF928B9306F88339C08a1B37424719cc09C6"
git push
```

### 5.3 Tag and Push OpenQ-Helm
- Tag and push `OpenQ-Helm` to the target environment like so: 

```bash
git tag <ENVIRONMENT>-<SEMVER>
git push origin <ENVIRONMENT>-<SEMVER>
```

### 5.4 Monitor Build on CircleCI
- Monitor deployment at https://app.circleci.com/pipelines/github/OpenQDev

## Verify Deployment
- Wait 5 minutes for new pods to roll out on our Kubernetes cluster
- See changes to following environments

| Environment      | URL |
| ----------- | ----------- |
| Development      | [development.openq.dev](https://development.openq.dev)       |
| Staging      | [staging.openq.dev](https://staging.openq.dev)       |
| Production   | [app.openq.dev](https://app.openq.dev)        |
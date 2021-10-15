# Bootscripts

Shell script for booting the full OpenQ stack in one go.

## Environments

To clone all repos and boot locally, run:

```bash
./boot.sh docker
```

```bash
./boot.sh docker --build
```

## Getting started

1. Create a file called `PAT` in the root of the project

2. Put your GitHub Personal Access Token (PAT) in the `PAT` file like `PAT=nweirubffsk`.

3. Run the environment you want:

```bash
./boot.sh docker
```

4. Access frontend on localhost:3000 and backend on localhost:8090.

5. Any changes you make to an application will trigger an update.

6. Run with sudo in case your having trouble with the bash script / docker compose only works in old versions
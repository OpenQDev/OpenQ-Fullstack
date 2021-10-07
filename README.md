# Bootscripts

Shell script for booting the full OpenQ stack in one go.

## Environments

### boot_mock.sh
Boots everything, but the frontend will be interacting with mocked versions of the backing services.

Excellent for frontend only design.

### boot_local.sh
Boot the full stack locally and connect it all.

## Getting started

1. Create a file called `PAT` in the root of the project

2. Put your GitHub Personal Access Token (PAT) in the `PAT` file like `PAT=nweirubffsk`.

3. Run the environment you want:

```bash
./boot_local.sh
```

4. Access frontend on localhost:3000 and backend on localhost:8090.

5. Any changes you make to fronend or OpenQ-API will trigger and update.

6. Run with sudo in case your having trouble with the bash script / docker compose only works in old versions

## Rebuilding images

Passing the argument `build` after `./boot_local.sh` will rebuild the frontend and backend images with `docker compose --build`.

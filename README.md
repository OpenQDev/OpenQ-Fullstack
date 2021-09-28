# Bootscripts 

## Running boot_local.sh

1. Put your GitHub Personal Access Token (PAT) in the `PAT` file.

2. Run it
```bash
./boot_local.sh
```

3. Access frontend on localhost:3000 and backend on localhost:8090

4. Any changes you make to fronend or OpenQ-API will trigger and update

5. Run with sudo in case your having trouble with the bash script / docker compose only works in old versions.

## Rebuilding Images after environment or dependency change
Passing the argument `build` after `./boot_local.sh` will rebuild the frontend and backend images with `docker compose --build`.    
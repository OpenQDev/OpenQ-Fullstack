# Bootscripts 

## Running boot_local.sh

1. Boot a local Ethereum RPC node on localhost:8545

2. Run it
```bash
./boot_local.sh
```

3. Access frontend on localhost:3000 and backend on localhost:8090

4. Any changes you make to fronend or OpenQ-API will trigger and update

5. Run with sudo in case your having trouble with the bash script / docker compose only works in old version

## NOTE
Passing the argument `build` after `./boot_local.sh` will rebuild the frontend and backend images with `docker compose --build`.    
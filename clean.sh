#!/bin/bash

function clean {
	echo "[*] cleaning containers installation"
	docker compose down
	docker rm -f $(docker ps -a -q)
	docker volume rm $(docker volume ls -q)
}

read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        clean
        ;;
    *)
        exit 1 
        ;;
esac

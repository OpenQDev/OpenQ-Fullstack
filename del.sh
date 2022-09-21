#!/bin/bash
. ./colors.sh

declare -a tags=(
"staging-0.1.2"
"staging-0.1.3"
"staging-0.1.4"
"staging-0.1.5"
"staging-0.1.6"
"staging-0.1.7"
"staging-0.1.8"
"staging-0.1.9"
"production-0.1.0"
"production-0.1.1"
"production-0.1.2"
"staging-0.1.0"
"staging-0.1.1"
"staging-0.1.10"
                )

cd ./OpenQ-Token-Price-Cron-Job

for tag in "${tags[@]}"
do
    echo -e "\n${BBlue}$tag${Color_Off}"
		git tag -d "$tag"
    git push origin --delete "$tag"
done
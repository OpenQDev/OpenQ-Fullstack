#!/bin/bash
. ./colors.sh

declare -a tags=(
"staging-3"
"staging-4"
"staging-5"
"staging-6"
"staging-7"
"staging-8"
"staging-9"
"staging-26"
                )

cd ./OpenQ-Frontend

for tag in "${tags[@]}"
do
    echo -e "\n${BBlue}$tag${Color_Off}"
		git tag -d "$tag"
    git push origin --delete --no-verify "$tag"
done
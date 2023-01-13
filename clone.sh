clone() {
    if [ -d "./$1" ]; then
        echo -e "${Blue}$1 directory found${Color_Off}\n"
    else
        if [ -n "$OPENQ_FORKS" ]; then
            IFS=',' read -r -a forks <<< "$OPENQ_FORKS"
            for fork in "${forks[@]}"; do
                repo_name=$(echo "$fork" | awk -F '/' '{print $2}')
                if [ "$repo_name" = "$1" ]; then
                    username=$(echo "$fork" | awk -F '/' '{print $1}')
                    echo -e "${UCyan}No $1 directory found. Cloning $1 from $username...${Color_Off}\n"
                    git clone "https://github.com/$username/$1.git"
                    return
                fi
            done
        fi
        echo -e "${UCyan}No $1 directory found. Cloning $1 from OpenQDev...${Color_Off}\n"
        git clone https://github.com/OpenQDev/$1.git
    fi
}

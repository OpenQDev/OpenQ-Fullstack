if [[ -z "$PAT" ]]; then
	echo -e "${Yellow}You need to set your GitHub PAT as an environment variable and run boot.sh again:${Color_Off}\n"
	echo -e "export PAT=..."
	exit 1
fi

generate_dot_env() {
	if [ -f "./$1/.env.sample" ]; then
		if [ ! -f "./$1/.env" ]; then
			echo -e "${UCyan}Generating $1/.env${Color_Off}\n"
			cp "./$1/.env.sample" "./$1/.env"
			sed -i 's/PAT=.*/PAT='"$PAT"'/' "./$1/.env"
			sed -i 's/PATS=.*/PATS='"$PAT"'/' "./$1/.env"
		else
			echo -e "${Blue}$1/.env already exists${Color_Off}\n"
		fi
	fi
}
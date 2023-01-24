if [[ -z "$PAT" ]]; then
	echo -e "${Red}\$PAT required.${Color_Off}"
fi

if [[ -z "$OAUTH_CLIENT_ID" ]]; then
	echo -e "${Red}\$OAUTH_CLIENT_ID required.${Color_Off}"
fi

if [[ -z "$OAUTH_CLIENT_SECRET" ]]; then
	echo -e "${Red}\$OAUTH_CLIENT_SECRET required.${Color_Off}"
fi

if [[ -z "$PAT" ]] || [[ -z "$OAUTH_CLIENT_ID" ]] || [[ -z "$OAUTH_CLIENT_SECRET" ]]; then
	exit 1
fi

generate_dot_env() {
	if [ -f "./$1/.env.sample" ]; then
		if [ ! -f "./$1/.env" ]; then
			echo -e "${UCyan}Generating $1/.env${Color_Off}\n"
			cp "./$1/.env.sample" "./$1/.env"
			sed -i 's/PAT=.*/PAT='"$PAT"'/' "./$1/.env"
			sed -i 's/PATS=.*/PATS='"$PAT"'/' "./$1/.env"
			sed -i 's/GITHUB_OAUTH_TOKEN=.*/GITHUB_OAUTH_TOKEN='"$PAT"'/' "./$1/.env"
			sed -i 's/OPENQ_ID=.*/OPENQ_ID='"$OAUTH_CLIENT_ID"'/' "./$1/.env"
			sed -i 's/OPENQ_SECRET=.*/OPENQ_SECRET='"$OAUTH_CLIENT_SECRET"'/' "./$1/.env"
		else
			echo -e "${Blue}$1/.env already exists${Color_Off}\n"
		fi
	fi
}
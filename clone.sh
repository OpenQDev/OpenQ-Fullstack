clone() {
	if [ -d "./$1" ]; then
		echo -e "${Blue}$1 directory found${Color_Off}\n"
	else
		echo -e "${UCyan}No $1 directory found. Cloning $1...${Color_Off}\n"
		git clone https://github.com/OpenQDev/$1.git
	fi
}
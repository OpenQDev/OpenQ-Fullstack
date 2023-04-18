git add .
git commit -m"updated to share node modules via docker"
git push origin "$(git branch --show-current)":docker-shared-modules
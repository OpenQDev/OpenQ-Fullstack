FROM node:18-alpine
WORKDIR /app
RUN apk add git

COPY . .
RUN echo "Installing dependencies"
RUN yarn 
CMD echo "Dependencies installed successfully"

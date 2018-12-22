# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang v1.11 base image
FROM golang:1.11

# Add Maintainer Info
LABEL maintainer="Rajeev Singh <rajeevhub@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/callicoder/go-docker

# Copy everything from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# Download all the dependencies
# https://stackoverflow.com/questions/28031603/what-do-three-dots-mean-in-go-command-line-invocations
RUN go get -d -v ./...

# Build the package
RUN go build -o ./out/go-docker .

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["./out/go-docker"]

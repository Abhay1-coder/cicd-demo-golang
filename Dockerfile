# Use a Go base image for the build stage
FROM golang:alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod .
COPY go.sum .

# Download dependencies
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN go build -o main .

# Use a lightweight base image for the final stage
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Copy the compiled binary from the build stage
COPY --from=build /app/main .

# Expose port 7024
EXPOSE 8085

# Command to run the executable
CMD ["./main"]

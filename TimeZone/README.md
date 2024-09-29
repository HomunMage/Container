# Time Zone

When working with Docker containers, it's crucial to set the correct timezone for your applications. Here are two straightforward methods to change the timezone in your Docker environment.

## Simple Method

For a quick and easy way to set the timezone, you can use this command in your Dockerfile:

```dockerfile
RUN ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
```

This command creates a symbolic link to the Singapore timezone file, allowing your container to reflect the correct time without any additional packages.

## Flexibility Method

Complex Method with `tzdata`

If you need more flexibility in changing timezones at runtime, follow these steps:

1. **Create a Dockerfile**:

```dockerfile
# Use the latest Debian image
FROM debian:latest

# Install tzdata package
RUN apt-get update && apt-get install -y tzdata

# Set environment variable for your timezone
ENV TZ=Asia/Singapore

# Configure the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
```

2. **Build the Image**:
   Build your Docker image with the following command:

   ```bash
   docker build -t tz-test .
   ```

3. **Run the Container with CLI**:
   You can change the timezone at runtime using the `-e` flag:

   ```bash
   docker run --rm -it -e TZ=Asia/Tokyo tz-test date
   ```

   This command will show the date and time in Tokyo.

#### Changing Timezone with Docker Compose

If you prefer using Docker Compose, you can set the timezone in your `docker-compose.yml` file:

```yaml
services:
  tz:
    build:
      context: ./tz
    environment:
      - TZ=Asia/Singapore
```


# Changed the base image to python:3.9-slim-buster, which is a lightweight version of the Python 3.9 image
FROM python:3.9-slim-buster

# Set the working directory to /src
WORKDIR /src

# Copy the requirements.txt file to the working directory
COPY requirements.txt /src

# Changed 'pip' to 'pip3' to specify the Python 3 version of pip
RUN apt-get update && apt-get install -y python3-pip && pip3 install --no-cache-dir -r requirements.txt

# Copy the entire current directory to the working directory
COPY . /src

# Expose port 80 to allow external access
EXPOSE 80

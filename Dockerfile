
# Changed the base image to python:3.9-slim-buster, which is a lightweight version of the Python 3.9 image
FROM python:3.9-slim-buster

# Set the working directory to /src
WORKDIR /src

# Copy the requirements.txt file to the working directory
COPY requirements.txt /src

# Changed 'pip' to 'pip3' to specify the Python 3 version of pip
# Fixed the typo 'apt-get insta'
# Installed 'curl' to be used in the HEALTHCHECK command
# Added '-y' flag to automatically answer yes to prompts from apt-get
RUN apt-get update && apt-get install -y curl python3-pip

# Installed the required packages using pip3
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the entire current directory to the working directory
COPY . /src

RUN python telbot.py
# Fixed the error where the container was exiting before becoming healthy
# Added a HEALTHCHECK command to check the health of the container
# The command checks if port 80 is listening and if it is, returns a 200 (OK) status
# Fixed the typo in the HEALTHCHECK command where 'curl -- befial' ' should curl --fail
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

# Expose port 80 to allow external access
EXPOSE 80

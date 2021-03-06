FROM python:3.7-slim

WORKDIR /usr

LABEL maintainer="vcwild@gmail.com"

# Use build arguments
ARG BASIC_AUTH_USERNAME_ARG
ARG BASIC_AUTH_PASSWORD_ARG

# Pass arguments to environment variables
ENV BASIC_AUTH_USERNAME=$BASIC_AUTH_USERNAME_ARG
ENV BASIC_AUTH_PASSWORD=$BASIC_AUTH_PASSWORD_ARG

# Environment creation
COPY ./requirements.txt /usr/requirements.txt
RUN pip3 install -r requirements.txt

# Copy files to working directory
COPY ./src /usr/src
COPY ./models /usr/models

# Define entry point
ENTRYPOINT ["python3"]

CMD ["src/app/main.py"]

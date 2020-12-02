FROM continuumio/miniconda3

WORKDIR /usr

# Use build arguments
ARG BASIC_AUTH_USERNAME_ARG
ARG BASIC_AUTH_PASSWORD_ARG

# Pass arguments to environment variables
ENV BASIC_AUTH_USERNAME=$BASIC_AUTH_USERNAME_ARG
ENV BASIC_AUTH_PASSWORD=$BASIC_AUTH_PASSWORD_ARG

# Environment creation
COPY ./environment.yml /usr/environment.yml
RUN conda env create -f environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "myenv", "/bin/zsh", "-c"]

# Copy files to working directory
COPY ./src /usr/src
COPY ./models /usr/models

# Define entry point
ENTRYPOINT ["conda", "run", "-n", "myenv", "python3", "src/app/main.py"]
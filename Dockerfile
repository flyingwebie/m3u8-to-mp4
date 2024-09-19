FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt update && apt install -y \
    ffmpeg \
    curl \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the script into the container
COPY script.sh /app/script.sh

# Make the script executable
RUN chmod +x /app/script.sh

# FIx Bash script – "/bin/bash^M: bad interpreter: No such file or directory"
#RUN sed -i -e 's/\r$//' /app/script.sh

# Run the script and then keep the container running
#CMD ["tail", "-f", "/dev/null"]

# Run the script
CMD ["/bin/bash", "/app/script.sh"]
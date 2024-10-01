# Use Python 3.11 slim base image
FROM python:3.11-slim

# Update the package list and install ffmpeg and opencc
RUN apt-get update && \
    apt-get install -y ffmpeg opencc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install virtualenv
RUN pip install --upgrade pip
RUN pip install virtualenv

# Create a new user and set the home directory
RUN useradd -ms /bin/bash myuser

# Set the working directory to the user's home directory
WORKDIR /home/myuser/

# Switch to the new user
USER myuser

# Create a virtual environment in the user's home directory
RUN virtualenv venv

# Add virtual environment activation to .bashrc
RUN echo "source ~/venv/bin/activate" >> /home/myuser/.bashrc

# Activate the virtual environment and upgrade pip
RUN . venv/bin/activate && pip install --upgrade pip

# Install Python packages in the virtual environment
RUN . venv/bin/activate && pip install openai-whisper yt-dlp 

# Trigger the download of the Whisper model
RUN /bin/bash -c "source ~/venv/bin/activate && python -c 'import whisper; whisper.load_model(\"large\")'"

# Set the working directory for your application
WORKDIR /home/myuser/workspace

# Default command
CMD ["bash"]

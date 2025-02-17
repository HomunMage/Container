# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Install SSH server and sudo
RUN apt-get update && apt-get install -y openssh-server sudo supervisor

# Set up the user and add to sudo group
ARG SSH_USERNAME
ARG SSH_PASSWORD
RUN useradd -m -s /bin/bash ${SSH_USERNAME} && \
    echo "${SSH_USERNAME}:${SSH_PASSWORD}" | chpasswd && \
    adduser ${SSH_USERNAME} sudo

# Set up SSH to accept connections
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
RUN echo "AllowUsers ${SSH_USERNAME}" >> /etc/ssh/sshd_config
RUN mkdir -p /home/${SSH_USERNAME}/.ssh
RUN chown ${SSH_USERNAME}:${SSH_USERNAME} /home/${SSH_USERNAME}/.ssh

COPY ./authorized_keys /home/${SSH_USERNAME}/.ssh/authorized_keys
RUN chown ${SSH_USERNAME}:${SSH_USERNAME} /home/${SSH_USERNAME}/.ssh/authorized_keys


# Copy the supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose the SSH port
EXPOSE 22

# Start supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
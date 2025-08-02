# Use the official Ubuntu image as the base
FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04

# Install SSH server and sudo
RUN apt-get update && apt-get install -y openssh-server sudo supervisor

# Allow 'ubuntu' user to sudo without a password
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ubuntu

# Set up SSH to accept connections
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
RUN echo "AllowUsers ubuntu" >> /etc/ssh/sshd_config
RUN mkdir -p /home/ubuntu/.ssh
RUN chown ubuntu:ubuntu /home/ubuntu/.ssh

COPY ./.ssh/authorized_keys /home/ubuntu/.ssh/authorized_keys
RUN chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
RUN chmod 600 /home/ubuntu/.ssh/authorized_keys

# Copy the supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
FROM debian:bullseye

# Install git, supervisor, VNC, & X11 packages
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y \
      bash \
      fluxbox \
      git
RUN apt-get install -y \
      net-tools \
      novnc \
      supervisor \
      x11vnc
RUN apt-get install -y xterm
RUN apt-get install -y vlc
RUN apt-get install -y gwenview
RUN apt-get install -y \
      ssh \
      xvfb
RUN apt-get install -y vim

# for sshd
RUN mkdir /run/sshd
RUN mkdir /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

# create a user
RUN groupadd comp
RUN useradd -d /home/comp --gid comp comp
RUN mkdir -p /home/comp
RUN mkdir -p /home/comp/.ssh
COPY authorized_keys /home/comp/.ssh/authorized_keys
RUN chown -R comp:comp /home/comp

# Setup demo environment variables
VOLUME data
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes
COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
EXPOSE 22

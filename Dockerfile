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

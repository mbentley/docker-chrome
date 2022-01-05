# rebased/repackaged base image that only updates existing packages
FROM mbentley/debian:bullseye
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y curl fluxbox gnupg2 sudo wget wmctrl x11vnc xvfb &&\
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list &&\
  apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y google-chrome-stable &&\
  echo 'user            ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/nopwsudo &&\
  rm -rf /var/lib/apt/lists/*

RUN useradd user &&\
  mkdir -p /home/user &&\
  chown user:user /home/user

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV TZ 'Europe/Madrid'

RUN echo $TZ > /etc/timezone 

RUN apt-get update && apt-get install -y wget gnupg

RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - && \
    apt-get install apt-transport-https && \
    echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

RUN apt-get update && \
    apt-get install -y --allow-downgrades --allow-remove-essential --fix-missing --allow-unauthenticated --no-install-recommends \
	supervisor \
        openssh-server pwgen sudo vim-tiny \
        net-tools \
        lxde x11vnc xvfb \
        ttf-ubuntu-font-family \
        firefox \
        nginx \
        nano \
        geany \
        evince \
        tzdata \
        systemd \
        build-essential && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean


ADD startup.sh /
ADD supervisord.conf /etc/supervisor/conf.d/


EXPOSE 5900
EXPOSE 22
WORKDIR /root
ENTRYPOINT ["/startup.sh"]

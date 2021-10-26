FROM debian:latest

RUN apt-get update &amp;&amp; apt-get install -y \
    unzip \
    wget
RUN wget -P /tmp "https://1fxmod.org/download/files/1fx.%20Mod%200.82-linux%20(v1.00).tar.gz"; wget -P /tmp "https://1fxmod.org/download/files/1fx.%20Mod%200.82b-hotfix%20(v1.00).zip"

FROM ubuntu:20.04

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean

RUN apt-get install -y unzip

# Copy source files to a temporary directory
ADD ./src /temp/

# Uncompress files
RUN mkdir /server && cp -r /temp/game/* /server/; \
    mkdir /temp/1fxmod && tar zxf /temp/1fx082.tar.gz -C /temp/1fxmod; \
    mkdir /temp/hotfix && unzip /temp/hotfix082b.zip -d /temp/hotfix

WORKDIR /server/1fx

COPY ./start.sh .

# Move files into their correct directories
RUN cp -r /temp/1fxmod/Server\ files/* /server/; \
    cp -r /temp/1fxmod/Optional\ files/RPM\ soundpack/rpm\ +\ extended.mvchat /server/1fx/files/mvchats/rpm\ +\ extended.mvchat && rm /server/1fx/files/mvchats/extended.mvchat; \
    cp -r /temp/hotfix/1fx/sof2mp_gamei386.so /server/1fx/sof2mp_gamei386.so

#Set permissions
RUN chmod +x "/server/sof2ded"; \
    chmod +x "/server/1fx/start.sh"

# Remove the temprary files
RUN rm -rf /temp

EXPOSE 20100/udp
EXPOSE 20100/tcp

ENTRYPOINT ["./start.sh"]
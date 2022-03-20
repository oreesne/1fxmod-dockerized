# SoF2 1fx. mod dockerized
This is the default settings for the mod, if you want to set custom settings, make a volume with the files you want to edit, they will overwrite the defaults and then start the server, an example would look like:\
`docker run --privileged --rm -v $(pwd):/server/1fx --name="sof2-server" -p 20100:20100/tcp -p 20100:20100/udp -it 1fx/server:0.82b`
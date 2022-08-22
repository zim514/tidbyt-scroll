FROM alpine:latest
#Update packages and install dependencies
RUN apk update && apk upgrade
#Create ytdl working dir
RUN mkdir -p /tidbyt
#Install pixlet
RUN wget https://github.com/tidbyt/pixlet/releases/download/v0.18.1/pixlet_0.18.1_linux_amd64.tar.gz
RUN tar -xf pixlet_0.18.1_linux_amd64.tar.gz
RUN ls
#Enable start.sh dummy file execution
#RUN chmod +x /ytdl/start/start.sh
#Create ytdl user so root isn't executing
#RUN adduser -D ytdl && chown -R ytdl /ytdl
#Change to ytdl user
#USER ytdl
#Change to ytdl home
#WORKDIR /ytdl
#Execute start script 
CMD echo $PATH
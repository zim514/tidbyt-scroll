FROM alpine:latest
#Update packages and install dependencies
RUN apk update && apk upgrade && apk add --no-cache python3 && apk add ffmpeg
#Install ytdlp, brand it as ytdl, and fix Python command to use Python3
RUN wget https://github.com/tidbyt/pixlet/releases/download/v0.18.1/pixlet_0.18.1_linux_amd64.tar.gz
#Create ytdl working dir
RUN mkdir -p /tidbyt
#Enable start.sh dummy file execution
RUN chmod +x /ytdl/start/start.sh
#Create ytdl user so root isn't executing
RUN adduser -D ytdl && chown -R ytdl /ytdl
#Change to ytdl user
USER ytdl
#Change to ytdl home
WORKDIR /ytdl
#Execute start script 
CMD ./start/start.sh
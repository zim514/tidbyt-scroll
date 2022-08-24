FROM ubuntu:latest
WORKDIR /tmp
#Update packages and install dependencies
RUN apt update && apt upgrade -y && apt install libwebp-dev wget gcc git -y
#Install Go
RUN wget https://go.dev/dl/go1.19.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"
#Install and build Pixlet
RUN git clone https://github.com/tidbyt/pixlet.git
WORKDIR /tmp/pixlet
RUN go get ./... && go build
RUN mv pixlet /usr/local/bin
#Create pixlet working dir
RUN mkdir -p /tidbyt
#Create tidbyt user so root isn't executing
RUN useradd -m tidbyt && chown -R tidbyt:tidbyt /tidbyt
#Change to tidbyt user
USER tidbyt
#TODO: Add step for .star file
CMD pixlet push $API $ID scroll.webp
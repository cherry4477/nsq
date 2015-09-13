FROM golang
MAINTAINER Sakeven "sakeven.jiang@daocloud.io"

# Build app
WORKDIR /gopath/app
ENV GOPATH /gopath/app
ADD . /gopath/app/src/github.com/bitly/nsq

run cd /gopath/app/src/github.com/bitly/nsq && \ 
    wget -qO- https://raw.githubusercontent.com/pote/gpm/v1.3.2/bin/gpm | bash && \
    make && \
    make install && \
    chmod +x nsq_role.sh && \
    mv nsq_role.sh  /bin/

EXPOSE 4150 4151 4160 4161 4170 4171

entrypoint  nsq_role.sh

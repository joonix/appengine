FROM ubuntu:xenial

RUN apt-get update -qq
RUN apt-get -y install unzip wget golang python2.7-minimal
RUN wget -q https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.40.zip -O /tmp/sdk.zip
RUN mkdir -p /usr/local
RUN cd /usr/local && unzip /tmp/sdk.zip > /dev/null && rm /tmp/sdk.zip

RUN apt-get -y install git
RUN mkdir -p /go/src/app
ENV GOPATH /go
RUN go get google.golang.org/appengine/...

RUN ln -s /go/src/app /app
VOLUME /app
WORKDIR /go/src/app
EXPOSE 8080 8000

ENTRYPOINT ["/usr/bin/python2.7", "/usr/local/go_appengine/dev_appserver.py", "--host", "0.0.0.0", "--admin_host", "0.0.0.0", "--skip_sdk_update_check", "1", "--automatic_restart", "1"]
CMD ["app.yaml"]

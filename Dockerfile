FROM golang:1.10

WORKDIR /oauth2_proxy

RUN go get -v github.com/bitly/oauth2_proxy && \
    go build -v -ldflags='-s -w' -o oauth2_proxy github.com/bitly/oauth2_proxy

EXPOSE 4180

ENTRYPOINT [ "./oauth2_proxy" ]

CMD [ "--http-address=0.0.0.0:4180" ]

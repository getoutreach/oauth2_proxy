FROM golang:1.10

WORKDIR /oauth2_proxy
COPY dist/. .

RUN mkdir ./bin && \
    tar --wildcards -O -xzf oauth2_proxy-*.linux-amd64.go*.tar.gz */oauth2_proxy-*.linux-amd64 > ./bin/oauth2_proxy && \
    chmod +x ./bin/oauth2_proxy

EXPOSE 4180

ENTRYPOINT [ "./bin/oauth2_proxy" ]

CMD [ "--http-address=0.0.0.0:4180" ]

FROM golang:1.10

WORKDIR /oauth2_proxy
COPY build-files .

EXPOSE 4180

ENTRYPOINT [ "./oauth2_proxy" ]

CMD [ "--http-address=0.0.0.0:4180" ]

FROM alpine:3.10

RUN apk add --no-cache ca-certificates

WORKDIR /oauth2_proxy
COPY . .

EXPOSE 4180

ENTRYPOINT [ "./oauth2_proxy" ]

CMD [ "--http-address=0.0.0.0:4180" ]

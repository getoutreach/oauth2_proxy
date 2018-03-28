# oauth2_proxy

This project builds a docker image of the [oauth2_proxy](https://github.com/bitly/oauth2_proxy) project.

## Local testing

To test a live example:

1. Create an OIDC application in our preview instance of [Okta](https://outreach.oktapreview.com)
1. Update `CLIENT_ID` and `CLIENT_SECRET` in `docker-compose.yml`
1. Run `docker-compose up -d`
1. In a browser, navigate to [http://localhost/] and verify that you can authenticate

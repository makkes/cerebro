FROM alpine:3.17.2 as builder
ARG BASEURL

RUN apk add --no-cache git make curl go npm hugo

WORKDIR /cerebro
COPY . .

RUN npm install postcss-cli
RUN hugo -b ${BASEURL}

FROM nginx:1.23.3-alpine-slim

USER 65534:65534

COPY --from=builder /cerebro/public /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/

FROM golang:1.18rc1-alpine3.14 AS build-env
RUN go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest

FROM alpine:3.15.0
RUN apk add --no-cache bind-tools ca-certificates
COPY --from=build-env /go/bin/uncover /usr/local/bin/uncover
ENTRYPOINT ["uncover"]

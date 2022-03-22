FROM golang:1.17-alpine as builder

WORKDIR /app
COPY go.* ./
RUN go mod download
COPY . .
RUN go build

FROM alpine
COPY --from=builder /app/autorestic /usr/bin/autorestic
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]

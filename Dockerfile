FROM golang:1.20 as builder

WORKDIR /usr/src/app

COPY go.mod main.go ./

RUN go build -o bin .

FROM scratch

WORKDIR /

COPY --from=builder /usr/src/app/bin /

CMD [ "/bin" ]
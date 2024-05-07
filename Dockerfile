FROM golang:alpine AS build-stage-desafio-1

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

COPY main.go /go/src

RUN CGO_ENABLED=0 go build -o /appDesafio main.go

FROM scratch
WORKDIR /

COPY --from=build-stage-desafio-1 /appDesafio /appDesafio

ENTRYPOINT [ "/appDesafio" ]
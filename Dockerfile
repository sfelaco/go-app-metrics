FROM golang:1.20.2-alpine3.17 AS build

WORKDIR /src/
COPY . /src/
RUN CGO_ENABLED=0 go build -o /bin/app

FROM scratch
COPY --from=build /bin/app /bin/app 
WORKDIR /bin
ENTRYPOINT ["/bin/app"]


FROM  golang:1.19 AS build
ADD . /src
WORKDIR /src
RUN go test --cover
RUN go build -o /usr/local/bin/main



FROM alpine:3.4
EXPOSE 8080
CMD ["main"]
COPY --from=build /src/main /usr/local/bin/main
RUN chmod +x /usr/local/bin/main

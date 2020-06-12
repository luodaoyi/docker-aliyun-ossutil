FROM golang as build
ENV OSSUTIL_VERSION 1.6.14
WORKDIR /go/src/aliyun 
RUN apk add --no-cache curl git && \
    curl -Lo /go/src/aliyun/ossutil.zip https://github.com/aliyun/ossutil/archive/${OSSUTIL_VERSION}.zip && \
    unzip /go/src/aliyun/ossutil.zip && \
    cd ossutil-${OSSUTIL_VERSION} && \
    go get && \
    go build && \
    cp ossutil-${OSSUTIL_VERSION} / 

FROM alpine
ENV OSSUTIL_VERSION 1.6.14
COPY --from=build /ossutil-${OSSUTIL_VERSION} /usr/local/bin/ossutil
ENTRYPOINT ["/usr/local/bin/ossutil"]


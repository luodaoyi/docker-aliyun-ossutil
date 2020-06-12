FROM alpine
ENV OSSUTIL_VERSION 1.6.14
RUN apk update && apk add libc6-compat
ADD http://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/ossutil64 /usr/local/bin/ossutil
RUN chmod a+x /usr/local/bin/ossutil
ENTRYPOINT ["/usr/local/bin/ossutil"]

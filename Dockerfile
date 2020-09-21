FROM python:3-alpine

RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install cython \
    && apk del .build-deps gcc musl-dev
    
ENV PATH /usr/local/bin:$PATH
ENV OSSUTIL_VERSION 1.6.19
RUN apk add --no-cache ca-certificates
ADD http://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/ossutil64 /usr/local/bin/ossutil
RUN chmod a+x /usr/local/bin/ossutil

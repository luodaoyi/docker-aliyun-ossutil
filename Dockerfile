FROM python:3-slim

ENV OSSUTIL_VERSION 1.6.19
ENV PATH /usr/local/bin:$PATH

RUN pip install --no-cache-dir aliyun-python-sdk-cdn aliyun-python-sdk-core

ADD http://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/ossutil64 /usr/local/bin/ossutil
RUN chmod a+x /usr/local/bin/ossutil

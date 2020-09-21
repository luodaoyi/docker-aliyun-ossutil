FROM debian:buster-slim

ENV OSSUTIL_VERSION 1.6.19
ENV PATH /usr/local/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		netbase \
	&& rm -rf /var/lib/apt/lists/*

ADD http://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/ossutil64 /usr/local/bin/ossutil
RUN chmod a+x /usr/local/bin/ossutil
ENTRYPOINT ["/usr/local/bin/ossutil"]
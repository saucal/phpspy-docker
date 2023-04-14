FROM ubuntu:22.04 as builder

RUN apt-get update \
	&& apt-get install -y git ca-certificates build-essential \
	&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
	&& rm -rf /var/libs/apt/lists/*

RUN mkdir -p /phpspy && cd /phpspy && git clone --recurse-submodules https://github.com/adsr/phpspy.git && cd phpspy && make

FROM ubuntu:22.04

COPY --from=builder /phpspy/phpspy/phpspy /usr/sbin/

RUN apt-get update \
	&& apt-get install -y binutils \
	&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
	&& rm -rf /var/libs/apt/lists/*

CMD [ "bash" ]

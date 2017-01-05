FROM ruby:2.4.0-alpine
MAINTAINER Tomoki Yamashita<tomorrowkey@gmail.com>

RUN apk --no-cache add build-base

RUN echo 'gem: --no-document' >> /etc/gemrc
RUN gem install fluentd

RUN mkdir -p /etc/fluent
COPY etc/fluent/fluent.conf /etc/fluent/

EXPOSE 24224 24224

ENTRYPOINT ["fluentd"]

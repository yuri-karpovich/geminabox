FROM ruby:2.3.4

RUN gem install --no-ri --no-rdoc geminabox -v 0.13.4
RUN mkdir -p /webapps/geminabox/config && \
	mkdir -p /webapps/geminabox/data

WORKDIR /webapps/geminabox/config
COPY assets/conf/config.ru /webapps/geminabox/config/config.ru

EXPOSE 9292
ENTRYPOINT ["rackup", "--host", "0.0.0.0"]

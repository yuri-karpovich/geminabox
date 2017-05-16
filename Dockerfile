FROM ruby:2.2

RUN apt-get install -y unicorn
RUN gem install --no-ri --no-rdoc geminabox -v 0.13.1

RUN mkdir -p /webapps/geminabox/config && \
	mkdir -p /webapps/geminabox/data

WORKDIR /webapps/geminabox/config

COPY assets/conf/config.ru /webapps/geminabox/config/config.ru

EXPOSE 9292

CMD ["unicorn", "-p", "9292"]

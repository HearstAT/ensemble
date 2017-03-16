FROM ruby:2.3-alpine
MAINTAINER Hearst Automation Team
ENV APP_HOME /opt/ensemble
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY supervisord.conf /etc/supervisor.d/supervisord.conf
COPY . .

RUN apk update $$ apk add build_deps &&\ 
    apk add bash supervisor git nodejs \
    openssl-dev postgresql-dev libpq postgresql-client libxml2-dev libxslt-dev &&\
    runDeps="$( \
		scanelf --needed --nobanner --recursive /usr/local \
			| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
			| sort -u \
			| xargs -r apk info --installed \
			| sort -u \
	)" &&\
    if [ -f Gemfile.lock ]; then rm -f Gemfile.lock; fi &&\
	apk add --virtual .ruby-builddeps $runDeps \
    build-base ruby-dev libc-dev linux-headers && \
    gem install bundler &&\
    bundle install --without development --binstubs &&\
    # bundle install --without development --binstubs --path vendor/bundle &&\
    # gem install sidekiq with development dependencies
    #gem install sidekiq --dev &&\
    #sed -i '/.*SECRET_KEY_BASE.*/c\'"  secret_key_base: `bundle exec rake secret RAILS_ENV=production`"'' /opt/ensemble/config/secrets.yml &&\
    yes | bundle exec rails app:update:bin &&\
    bundle exec rake assets:precompile RAILS_ENV=production
    #sed -i '/.*update-me.rds.amazonaws.com.*/c\'"  host: localhost"'' /opt/ensemble/config/database.yml &&\
    #bundle exec rake db:create RAILS_ENV=production &&\
    #bundle exec rake db:migrate RAILS_ENV=production $$\
    #apk del .ruby-builddeps &&\
    #rm -rf /var/cache/apk/* &&\
    #rm -rf /tmp/*

# rails
EXPOSE 3000

CMD ["supervisord", "-c", "/etc/supervisor.d/supervisord.conf", "-n"]

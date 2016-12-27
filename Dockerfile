FROM ruby:2.2

#FROM ruby:2.3
# Ruby 2.3 is failing with 
# hellorubyvscode_1  | bundler: failed to load command: rdebug-ide (/app/vendor/bundle/ruby/2.3.0/bin/rdebug-ide)
# hellorubyvscode_1  | LoadError: cannot load such file -- debase_internals
# may need to use the 2.2.x pre-release betas https://rubygems.org/gems/debase

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs postgresql && \
    apt-get autoremove -y && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# default ruby-debug port
EXPOSE 1234
# dispatcher port
EXPOSE 26162
# rails
EXPOSE 3000
COPY . /app
WORKDIR /app
RUN if [ -f Gemfile.lock ]; then rm -f Gemfile.lock; fi &&\
    rm -rf vendor/bundle

# have to bundle install to run rdebug-ide
# have to bundle install --binstubs --path vendor/bundle for sinatra
# TODO clean this up so only have to run one
RUN bundle install 
#; bundle install --binstubs --path vendor/bundle

# command/CMD is now in the docker-compose

# This command allows access to sinatra from the host
#CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4568"]

# These two are things I have tried but do not fully work yet.
#CMD ["bundle", "exec", "rdebug-ide", "--host", "0.0.0.0" , "--port", "1234", "rackup"]
#CMD ["bundle", "exec", "rdebug-ide", "--host", "0.0.0.0" , "--port", "1234", "--dispatcher-port", "26162", "--", "bin/rackup", "-p", "4567", "--host", "0.0.0.0"]
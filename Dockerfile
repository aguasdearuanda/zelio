FROM ruby:2.7-alpine
RUN apk update -qq && apk add nodejs postgresql-client imagemagick git \
        build-base \
        postgresql-dev \
        tzdata \
        bash \
        less
ADD . /myapp
WORKDIR /myapp
RUN gem install racc -v '1.5.2'

#RUN gem update bundler
RUN bundle install

CMD rails db:create db:migrate; bundle exec rails server -b 0.0.0.0
EXPOSE 3000

# rake db:migrate

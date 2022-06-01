FROM ruby:2.6.6

ADD . /wordguesser
WORKDIR /wordguesser
RUN bundle install

EXPOSE 3000

CMD bundle exec rackup --host 0.0.0.0 --port $PORT

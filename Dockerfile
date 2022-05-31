FROM ruby:2.6.6

ADD . /wordguesser
WORKDIR /wordguesser
RUN bundle install

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
# -m for Ubuntu, -D for Alpine
RUN useradd -m myuser
USER myuser

# Not using docker-compose anymore?
# CMD ["/bin/bash"]

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "$PORT"]

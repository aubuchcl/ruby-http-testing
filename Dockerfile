FROM ruby:latest

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY main.rb .

CMD ["ruby", "main.rb"]

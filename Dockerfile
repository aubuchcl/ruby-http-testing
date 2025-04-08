FROM ruby:3.1.7-alpine3.20
# FROM ruby:3.3.7-bookworm

WORKDIR /app

COPY Gemfile ./
RUN bundle install

COPY main.rb .

CMD ["ruby", "main.rb"]

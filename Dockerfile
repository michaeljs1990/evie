FROM ruby:2.3.3-alpine

WORKDIR /evie

# Install libs needed for sinatra extentions
RUN apk add -U g++ libc-dev make

COPY . .

RUN bundle install

CMD ["bundle","exec","puma","-C","config/puma.rb"]

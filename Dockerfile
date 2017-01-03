FROM ruby:2.3.3-alpine

WORKDIR /evie

# Default evie config file
ENV EVIE_CONFIG=/evie/config/sites/general.yml

# Install libs needed for sinatra extentions
RUN apk add -U g++ libc-dev make

COPY . .

RUN bundle install

CMD ["bundle","exec","puma","-C","config/puma.rb"]

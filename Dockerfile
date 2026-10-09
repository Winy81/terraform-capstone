FROM ruby:3.2

WORKDIR /app

COPY Gemfile .

RUN gem install bundler
RUN bundle install

COPY app.rb .

EXPOSE 80

CMD ["ruby", "app.rb"]

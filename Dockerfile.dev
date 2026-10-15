# Development approach:
#
# Build runtime image:
# docker build -t ruby-runtime .
#
# Run container with mounted application files:
#
# docker run -d \
#   --name sinatra-app \
#   -p 8080:80 \
#   -v $(pwd)/app.rb:/app/app.rb \
#   -v $(pwd)/Gemfile:/app/Gemfile \
#   ruby-runtime \
#   ruby app.rb
#
# This image contains only the Ruby/Sinatra runtime.
# The application files (app.rb and Gemfile) are mounted from the host.
# This allows application changes without rebuilding the image.

FROM ruby:3.2

WORKDIR /app

RUN gem install sinatra
RUN gem install rackup
RUN gem install puma

EXPOSE 80

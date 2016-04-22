FROM ruby:2.3
MAINTAINER Zach Latta <zach@hackclub.com>

# Set locale to use UTF-8 (from
# https://github.com/johnotander/pixyll/issues/193#issuecomment-139865963)
ENV LC_ALL C.UTF-8

# For the JavaScript runtime
RUN apt-get update && apt-get -y install nodejs

WORKDIR /usr/src/app/

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install -j8

COPY . /usr/src/app/

EXPOSE 8080
CMD ["jekyll", "serve", "-P", "8080", "-H", "0.0.0.0"]

################################################################################
# Development image
################################################################################
FROM ruby:3.1.2-alpine
ENV BUNDLER_VERSION=2.3.7
RUN apk add --update --no-cache \
  binutils-gold \
  build-base \
  bash \
  curl \
  file \
  g++ \
  gcc \
  git \
  less \
  libstdc++ \
  libffi-dev \
  libc-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  libgcrypt-dev \
  netcat-openbsd \
  openssl \
  pkgconfig \
  postgresql-dev \
  tzdata

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install
COPY . .
ENTRYPOINT ["./entrypoints/rails-entrypoint.sh"]

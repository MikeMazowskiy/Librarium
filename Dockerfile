# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.0.2
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /app

# Set staging environment
ENV RAILS_ENV="staging" \
    BUNDLE_WITHOUT="development:test" \
    BUNDLE_DEPLOYMENT="1"

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y && \
    apt-get -y install curl && \
    apt-get install -y apt-transport-https \
    build-essential \
    nodejs \
    npm \
    postgresql-client && \
    rm -rf /var/lib/apt/lists/* \


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems and node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips node-gyp pkg-config python-is-python3

# Install yarn
ARG YARN_VERSION=1.22.19
RUN npm install -g yarn@$YARN_VERSION

# Build options
ENV PATH="/usr/local/node/bin:$PATH"

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install --jobs 4

COPY .env.sample ./
# Install node modules
COPY --link package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy the application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN RAILS_ENV=staging bundle exec rails assets:precompile

# Expose ports
EXPOSE 3000

# Set the entrypoint command
CMD ["rails","server","-b","0.0.0.0"]
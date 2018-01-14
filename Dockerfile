FROM ruby:2.5.0

RUN apt-get update && apt-get install -y nodejs mysql-client postgresql-client sqlite3 ---no-install-recommends && rm -rf /var/lib/apt/lists/*

# install chrome headless
RUN apt-get install -y libappindicator1 fonts-liberation
ENV CHROME_BIN=/usr/bin/google-chrome
RUN wget -qO /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && cd /tmp \
    && dpkg -i google-chrome-stable_current_amd64.deb

ENV RAILS_VERSION 5.1.4

RUN gem install rails --version "$RAILS_VERSION"

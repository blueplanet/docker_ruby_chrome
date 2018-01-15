FROM ruby:2.5.0

RUN apt-get update && apt-get install -y nodejs mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# install chrome headless
RUN apt-get install -y udev ttf-freefont chromium chromium-chromedriver && rm -rf /var/lib/apt/lists/*

# 日本語フォント
RUN mkdir /noto
ADD https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip /noto 
WORKDIR /noto

RUN unzip NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/noto && \
    cp *.otf /usr/share/fonts/noto && \
    chmod 644 -R /usr/share/fonts/noto/ && \
    fc-cache -fv

WORKDIR /
RUN rm -rf /noto


ENV RAILS_VERSION 5.1.4

RUN gem install rails --version "$RAILS_VERSION"
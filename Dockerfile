FROM ruby:3.2.2


RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list &&\
    wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    apt-get update -qq && \
    apt-get install -y build-essential


WORKDIR /var/app
COPY . .


RUN bundle config timeout 240

RUN bundle install -j4


ENTRYPOINT [ "./entrypoint.sh" ]
FROM atlashealth/ruby:2.1.2

ENV DEBIAN_FRONTEND noninteractive

# Install any dependencies needed by Rails
RUN apt-get update -q && \
    apt-get install -qy curl libpq-dev libqt4-dev xvfb sqlite3 libsqlite3-dev imagemagick --no-install-recommends && \

    # install Node for asset minification
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -qy nodejs && \

    # cleanup
    apt-get clean && \
    cd /var/lib/apt/lists && rm -fr *Release* *Sources* *Packages* && \
    truncate -s 0 /var/log/*log



# https://github.com/docker/docker/issues/4032
ENV DEBIAN_FRONTEND newt

ENV GEM_HOME /ruby_gems/2.1
ENV PATH /ruby_gems/2.1/bin:$PATH

ADD . /app
WORKDIR /app

EXPOSE 3000 1080

CMD /app/script/start
#CMD /bin/bash -l
#CMD bin/foreman start

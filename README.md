# Invoiding Application

A rails app to help me with my invoicing and billing. It also serves
as a bit of a showcase for my Rails abilities.

## Requirements

* Postgresql 9.3
* Ruby 2.2.0
* Rails 4.2.0

### For Docker

* boot2docker (on OS/X)
* docker
* docker-compose

## Installation

Install the application from Github:

    $ git clone https://github.com/tamouse/invoicing.git /path/to/invoicing
    $ bundle install
    $ bundle binstub foreman
    $ bundle binstub mailcatcher
    $ bin/rake db:create db:setup

### Using Docker

This app has been [dockerized](http://www.docker.com) for development (I still have to
deal with deployment, but I'm not ready for that yet).

Most of what's happening with Docker has been lifted from
[this blog post](http://www.atlashealth.com/blog/2014/09/persistent-ruby-gems-docker-container/)
with a few modifications.

To build and start up the application:

    $ docker-compose up

from the application root. This will bundle the gems, set up the
database if needed, clean out `tmp/` and `logs/` and then run the
application using `foreman`.

## Running the Application

For development, the foreman `Procfile` will start up the server and
mailcatcher:

    $ bin/foreman start

## Testing

I'm only running `rspec` tests, no `cucumber`.

    $ bin/rake spec

You can also run `rspec` directly, but you may need to prepare the
test database accordingly.

    $ bin/rake db:test:prepare
    $ bin/rspec \[options\] \[tests\]

### From docker-compose

You can execute these from docker-compose directly:

    $ docker-compose run dev bin/rake spec

## Make convenience commands

The Makefile contains convenient commands for the set up and running
of the system.

Run

    $ make

for a list of make commands.

## Deployment

T.B.D.

## Contibuting

[Contributing Doc](CONTRIBUTING.md)

## License

[License Info](LICENSE.txt)

## Change Log

[Change log](CHANGELOG.md)

# Invoiding Application

A rails app to help me with my invoicing and billing. It also serves
as a bit of a showcase for my Rails abilities.

## Requirements

* Postgresql 9.3
* Ruby 2.2.0
* Rails 4.2.0

## Installation

Install the application from Github:

    $ git clone https://github.com/tamouse/invoicing.git /path/to/invoicing
    $ bundle install
    $ bundle binstub foreman
    $ bundle binstub mailcatcher
    $ bin/rake db:create db:setup

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

## Deployment

T.B.D.

## Contibuting

[Contributing Doc](CONTRIBUTING.md)

## License

[License Info](LICENSE.txt)

## Change Log

[Change log](CHANGELOG.md)

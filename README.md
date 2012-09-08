# AwesomeLogger

A Logger API compliant logger that will keep track of things like log levels and time stamps for you. Use case is more for small chunks of activity logging that belongs together, usually for dumping into JSON and writing out to a file, printing on the terminal, or even writing to a database for tracking.


## Installation

Add this line to your application's Gemfile:

    gem 'awesome_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install awesome_logger

## Usage

    logger = AwesomeLogger.new

    logger.log "Something happened"
    logger.fatal "Something terrible happened"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

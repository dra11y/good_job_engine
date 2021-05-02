# GoodJobEngine

This gem contains only the extracted GoodJob Dashboard Rails Engine from the [GoodJob gem on GitHub](https://github.com/bensheldon/good_job/).

It is intended to be a drop-in replacement for the built-in engine so that the admin dashboard can be enhanced separately from the GoodJob backend.

The GoodJobEngine version is intended to mirror the current GoodJob release version it is compatible with.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'good_job_engine'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install good_job_engine

## Usage

![Dashboard UI](https://github.com/bensheldon/good_job/raw/main/SCREENSHOT.png)

_🚧 GoodJob's dashboard is a work in progress. Please contribute ideas and code on [GoodJobEngine on GitHub](https://github.com/tgrushka/good_job_engine/issues)._

GoodJob includes a Dashboard as a mountable `Rails::Engine`.

1. Explicitly require the Engine code at the top of your `config/application.rb` file, immediately after Rails is required. This is necessary because the mountable engine is an optional feature of GoodJob.

    ```ruby
    # config/application.rb
    require_relative 'boot'

    require 'rails/all'
    require 'good_job_engine/engine' # <= Add this line
    # ...
    ```

1. Mount the engine in your `config/routes.rb` file. The following will mount it at `http://example.com/good_job`.

    ```ruby
    # config/routes.rb
    # ...
    mount GoodJobEngine::Engine => 'good_job'
    ```

    Because jobs can potentially contain sensitive information, you should authorize access. For example, using Devise's `authenticate` helper, that might look like:

    ```ruby
    # config/routes.rb
    # ...
    authenticate :user, ->(user) { user.admin? } do
      mount GoodJobEngine::Engine => 'good_job'
    end
    ```

    Another option is using basic auth like this:

    ```ruby
    # config/initializers/good_job.rb
    GoodJobEngine::Engine.middleware.use(Rack::Auth::Basic) do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(Rails.application.credentials.good_job_username, username) &&
        ActiveSupport::SecurityUtils.secure_compare(Rails.application.credentials.good_job_password, password)
    end
    ```

### Gem development

To run tests:

```bash
# Clone the repository locally
$ git clone git@github.com:tgrushka/good_job_engine.git

# Set up the local environment
$ bin/setup

# Run the tests
$ bin/rspec
```

This gem uses Appraisal to run tests against multiple versions of Rails:

```bash
# Install Appraisal(s) gemfiles
$ bundle exec appraisal

# Run tests
$ bundle exec appraisal bin/rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tgrushka/good_job_engine.


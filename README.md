# DustbinLorry

DustinLorry: a simple Rack Middleware that dumps information about the Ruby MRI runtime (currently just if the method caches change during a Rack request).

## Installation

Add this line to your application's Gemfile:

```gem 'dustbin_lorry'```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dustbin_lorry    

## Usage

### Rails

Add ```config.middleware.use 'Rack::DustbinLorry'``` to your ```config/application.rb```. The middleware will use ```Rails.Logger``` to output if any changes occur in the method caches.

### Sinatra

Add ```use DustbinLorry``` like any other Rack Middleware.

## Contributing

1. Fork it ( https://github.com/falloutdurham/dustbin_lorry/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[![Maintainability](https://api.codeclimate.com/v1/badges/8177e6f1110700d430fa/maintainability)](https://codeclimate.com/github/oluosiname/omniauth-xing-oauth2/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8177e6f1110700d430fa/test_coverage)](https://codeclimate.com/github/oluosiname/omniauth-xing-oauth2/test_coverage)

# Omniauth::Xing::Oauth2

A Xing OAuth2 strategy for OmniAuth.

## Installation

```ruby
gem 'omniauth-xing-oauth2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-xing-oauth2

## Usage

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :xing, "consumer_key", "consumer_secret"
end


## Auth Hash
Here's an example Auth Hash available in request.env['omniauth.auth']:

{
  provider: 'facebook',
  uid: '1234567',
  info: {
    email: 'joe@bloggs.com',
    name: 'Joe Bloggs',
    first_name: 'Joe',
    last_name: 'Bloggs',
    image: 'http://graph.facebook.com/1234567/picture?type=square',
    verified: true
  },
  credentials: {
    token: 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    expires_at: 1321747205, # when the access token expires (it always will)
    expires: true # this will always be true
  },
  extra: {
    raw_info: {
      id: '1234567',
      name: 'Joe Bloggs',
      first_name: 'Joe',
      last_name: 'Bloggs',
      link: 'http://www.facebook.com/jbloggs',
      username: 'jbloggs',
      location: { id: '123456789', name: 'Palo Alto, California' },
      gender: 'male',
      email: 'joe@bloggs.com',
      timezone: -8,
      locale: 'en_US',
      verified: true,
      updated_time: '2011-11-11T06:21:03+0000',
      # ...
    }
  }
}

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oluosiname/omniauth-xing-oauth2.

Fork it
Create your feature branch (git checkout -b my-new-feature)
Commit your changes (git commit -am 'Add some feature')
Push to the branch (git push origin my-new-feature)
Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

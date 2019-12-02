# Capistrano Cloudflare 
[![Build Status](https://travis-ci.org/aaemnnosttv/capistrano-cloudflare.svg?branch=master)](https://travis-ci.org/aaemnnosttv/capistrano-cloudflare)

[Cloudflare](http://www.cloudflare.com/) is a service that protects and speeds up websites. Capistrano Cloudflare provides [Capistrano](https://github.com/capistrano/capistrano/wiki/Documentation-v2.x) tasks to update your Cloudflare settings.

Capistrano Cloudflare Version 2.0 and above supports the new Capistrano v3 API. For compatbility with Capistrano v2, please use version `0.0.2`.

This fork of the library supports Cloudflare's version 4 API

Currently only cache purging is supported.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-cloudflare', :git => 'https://github.com/aaemnnosttv/capistrano-cloudflare.git'

And then execute:

    $ bundle

## Usage

Add the following line to your `Capfile`

```ruby
require 'capistrano/cloudflare'
```

### Configure `cloudflare_options` in `deploy.rb`

**Using an API token**  
_requires `cache_purge:edit` permission_

```ruby
set :cloudflare_options, {
    :zone      => 'yourzoneid',
    :api_token => 'yourapitoken',
}
```

**Using an API key**

```ruby
set :cloudflare_options, {
    :zone    => 'yourzoneid',
    :email   => 'me@example.com',
    :api_key => 'yourapikey'
}
```

See here for more information about the differences between tokens and keys:  
https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys

The following Capistrano tasks should now be available when running `bundle exec cap --tasks`

* `cloudflare:cache:purge`

> Note these are not hooked automatically.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The MIT License (MIT)
Copyright (c) 2012 Cramer Development, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

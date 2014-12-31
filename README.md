# Capistrano::Ec2Tagged

Get IP addresses of AWS EC2 instances filtered by their tags.

## Requirements

* aws-sdk-v1
* capistrano ~> 3.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-ec2_tagged'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-ec2_tagged

## Usage

Add this line to your application's Capfile:

```ruby
require 'capistrano/ec2_tagged'
```

And set credentials with AmazonEC2ReadOnlyAccess permission in config/deploy.rb as:


```ruby
set :aws_access_key_id, "YOUR ACCESS KEY ID"
set :aws_secret_access_key, "YOUR SECRET ACCESS KEY"
set :aws_region, "ap-northeast-1"
```

Then call `ec2_tagged` method in each stage files like config/deploy/production.rb as:

```ruby
role :web, ec2_tagged("Name" => "my-web-server")
role :app, ec2_tagged("Name" => "my-app-server")
role :db,  ec2_tagged("Name" => "my-db-server")
```


## Contributing

1. Fork it ( http://github.com/a2ikm/capistrano-ec2_tagged/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

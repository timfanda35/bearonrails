# Bearonrails

[![RubyGems][gem_version_badge]][ruby_gems]
[![RubyGems][gem_downloads_badge]][ruby_gems]

Bearonrails is the base Rails application generator.(For Rails 4.2+)

## Installation

First install the bearonrails gem:

    $ gem install bearonrails

Then run:

    $ bearonrails project_name

## New Relic

For New Relic, edit `.env`, set New Relic License key to `NEW_RELIC_LICENSE_KEY`

```shell
NEW_RELIC_APP_NAME=change-this-to-your-app-name
NEW_RELIC_LICENSE_KEY=change-this-to-your-new-relic-license-key

```

## Rubocop

For code style, edit `.rubocop.yml` to customize coding style rules. See sample(https://github.com/bbatsov/rubocop/blob/master/config/default.yml).

You could integrate your editor with rubocop, see [rubocop editor-integration](https://github.com/bbatsov/rubocop#editor-integration).

## Dotenv

Use `.env` to manage environment varibales. And load environment varibales set in `.env` file when Rails Application start.

See `config/application.rb`

```
# Added this line
Dotenv.load
```

## Gems

#### Rails console

* [awesome_rails_console](https://github.com/michaeldv/awesome_print)
  * [pry-rails](https://github.com/rweng/pry-rails)
  * [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
  * [awesome_print](https://github.com/michaeldv/awesome_print)
  * [hirb](https://github.com/cldwalker/hirb)
  * [hirb-unicode](https://github.com/miaout17/hirb-unicode)

#### Developing

* [quiet_assets](https://github.com/evrone/quiet_assets)
* [capistrano-rails](https://github.com/capistrano/rails/)
* [capistrano-bundler](https://github.com/capistrano/bundler/)

#### Coding Style

* [rubocop](https://github.com/bbatsov/rubocop)
* [brakeman](https://github.com/presidentbeef/brakeman)

#### Testing

* [rspec-rails](https://github.com/rspec/rspec-rails)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
* [faker](https://github.com/stympy/faker)

#### Environment

* [dotenv](https://github.com/bkeepers/dotenv)

#### Metric

* [newrelic_rpm](https://github.com/newrelic/rpm)

## Reference:

[xdite/bootstrappers](https://github.com/xdite/bootstrappers)

[超棒的 rails console 設定](http://toyroom.bruceli.net/tw/2014/08/13/awesome-rails-console-customization-using-pry.html)

[Rails Application Template Guide](http://guides.rubyonrails.org/rails_application_templates.html)

## MIT License


# Devise Automatic Logout
By Thadeu Esteves Jr.

Provides automatic session timeout in a Rails application. Very easy to install and configure. Have you ever wanted to force your users off your app if they go idle for a certain period of time? Many online banking sites use this technique. If your app is used on any kind of public computer system, this plugin is a necessity.

* Force your users power off session
* show for they the regressive time

## Getting started

You can add it to your Gemfile with:

```ruby
gem 'devise-automaticlogout'
```

Then run bundle install

## How to use?

## Configure Timeoutable in /config/initializers/devise.rb

Besides :stretches, you can define :pepper, :encryptor, :confirm_within, :remember_for, :timeout_in, :unlock_in among other options. For more details, see the initializer file that was created when you invoked the "devise:install" generator described above. This file is usually located at /config/initializers/devise.rb.

[Configure time](https://github.com/plataformatec/devise#configuring-models)

[More informations](http://www.rubydoc.info/github/plataformatec/devise/master/Devise/Models/Timeoutable)

### Configure Javascript
Add in your application.js this require

```javascript
//= require automatic_logout
```
### Configure View (OPTIONAL)

Use Helper in your view, for show regressive timer. Add this in your file application.html.erb

```ruby
<%= regressive_timer %>
```

## TODO


## Contributing

We have a long list of valued contributors. Check them all at: https://github.com/Thadeu/devise-automaticlogout.

New Venture Institute App
=========================

This is the Rails application that runs the New Venture Institute website.

This README consists of a few different parts.  Here's a table of contents:

* [Setting Up Your Local Environment](#setting-up)
* [A General Overview of How The App Works](#overview)
* [How to Deploy](#deploying)
* [Managing the Heroku Deployment](#managing-heroku)

* * *

<a id="setting-up"></a>Setting Up Your Local Environment (OS X Lion)
=================================================================

If you are setting up a brand new computer that hasn't been previously setup for development (No SSH keys, no package manager (homebrew), no ruby version manager) then you should set up your environment using my setup script at [willcosgrove/laptop](http://github.com/willcosgrove/laptop).  If you have a partially set up environment, then its probably best to selectivly install what you need.  Here is a list of what you need to develop the NVI app:

* [Homebrew](#homebrew)
* [Memcached](#memcached)
* [Ruby](#ruby)
* [Bundler gem](#bundler)
* [Rails gem](#rails)
* [Heroku gem](#heroku)

<a id="homebrew"></a>[Homebrew](http://mxcl.github.com/homebrew/)
--------------------------------------------------------------

[Homebrew](http://mxcl.github.com/homebrew/) is a package manager for OS X.  It's amazing, and everyone needs it.  It will be used to installed several of the other things in this list, which is why it's here.  To install it, simply run:

    $ /usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

In your terminal.  If you would like to read more about what it's doing, you can check out the [official installation instructions](https://github.com/mxcl/homebrew/wiki/installation).

<a id="memcached"></a>[Memcached](http://memcached.org/)
-----------------------------------------------------

[Memcached](http://memcached.org/) is the software NVI app uses to cache all of the various page fragments so that the website can be as snappy and responsive as possible.  This isn't required for your development environment, but you will need to disable development caching in the `developent.rb` file by setting this:

    config.action_controller.perform_caching = false

I like to have it on, because I want to make sure that the caching is working as I expect it to, and because some of the DB queries are quite intensive and can lead to some long page loads.

But on to the installation, all you need to run is:

    $ brew install memcached

And you should be good to go.

<a id="ruby"></a>Ruby
----------------------

To install and manage different versions of Ruby, I recommend using [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build).  The two can be easily installed using homebrew with the following commands:

    $ brew install rbenv
    $ brew install ruby-build
    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

**Zsh note**: Modify your `~/.zshenv` file instead of `~/.bash_profile`.

Once you have rbenv and ruby-build installed, you can install and set the default ruby ruby with:

    $ rbenv install 1.9.3-p125
    $ rbenv rehash
    $ rbenv global 1.9.3-p125

**rbenv note**: Anytime you install a new ruby binary or a gem that has a binary, you need to run `rbenv rehash` for those to be picked up.

<a id="bundler"></a>[Bundler](http://gembundler.com/)
-----------------------------------------------------

[Bundler](http://gembundler.com/) is a gem depencency manager, which is used by Rails since Rails 3.  It can be easily installed with:

    $ gem install bundler

With that installed, you can easily install all of the gem dependencies of the NVI app by running `bundle install` inside of the NVI directory.  This will look at the `Gemfile` and the `Gemfile.lock` to figure out what needs to be installed.  Anytime you add or remove a dependency in the `Gemfile`, you need to run `bundle` to have it rebuild the `Gemfile.lock`.

<a id="rails"></a>[Rails](http://rubyonrails.org/)
-----------------------------------------------

[Rails](http://rubyonrails.org/) is the development framework the NVI is built with.  To install Rails, all you need to run is:

    $ gem install rails

I won't go into too much detail about Rails, because it's huge and I'll never be able to cover everything in the short guide, but one of the big things you'll use with it is `rails console` or just `rails c` which will start up a Rails console for your application.  You also use it to generate new controllers and models with `rails generate` or just `rails g`.

For help with all things Rails, I suggest you take a look at [Railscasts](http://railscasts.com/)

<a id="heroku"></a>[Heroku](http://heroku.com/)
--------------------------------------------

[Heroku](http://heroku.com/) is the cloud application platform that NVI is currently hosted on.  It is actually a specified dependency of NVI in the Gemfile, so just running `bundle` inside of the app directory should have installed the Heroku gem for you already.  If you want to check that you have it, run:

    $ heroku -v

And make sure that it outputs some version number.  If it is not installed, and you don't want to install all of the app dependencies right now, you can install the heroku gem with a simple:

    $ gem install heroku

The first time you run a command with it, you will have to provide your login credentials.  You'll want to login with an account that is either the Owner of the NVI app, or at least has development privileges for the NVI app.

The Heroku gem will let you control pretty much anything about the deployment.  For more info on what you can do with it, look at [Managing the Heroku Deployment](#managing-heroku).

* * *

<a id="overview"></a>A General Overview of How The App Works
============================================================

* * *

<a id="deploying"></a>How to Deploy
===================================

* * *

<a id="managing-heroku"></a>Managing the Heroku Deployment
==========================================================

* * *

If you need to contact me (Will Cosgrove) for any reason, about how something works, or why something isn't working, you can email me at [will@willcosgrove.com](mailto:will@willcosgrove.com).
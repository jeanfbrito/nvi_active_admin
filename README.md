New Venture Institute App
=========================

This is the Rails application that runs the New Venture Institute website.

This README consists of a few different parts.  Here's a table of contents:

* [Setting Up Your Local Environment](#setting-up-your-local-environment-os-x-lion)
* [A General Overview of How The App Works](#a-general-overview-of-how-the-app-works)
* [How to Deploy](#how-to-deploy)
* [Managing the Heroku Deployment](#managing-the-heroku-deployment)

* * *

Setting Up Your Local Environment (OS X Lion)
=============================================

If you are setting up a brand new computer that hasn't been previously setup for development (No SSH keys, no package manager (homebrew), no ruby version manager) then you should set up your environment using my setup script at [willcosgrove/laptop](http://github.com/willcosgrove/laptop).  If you have a partially set up environment, then its probably best to selectivly install what you need.  Here is a list of what you need to develop the NVI app:

* [Homebrew](#homebrew)
* [Memcached](#memcached)
* [Ruby](#ruby)
* [Bundler gem](#bundler)
* [Rails gem](#rails)
* [Heroku gem](#heroku)

[Homebrew](http://mxcl.github.com/homebrew/)
--------------------------------------------

[Homebrew](http://mxcl.github.com/homebrew/) is a package manager for OS X.  It's amazing, and everyone needs it.  It will be used to installed several of the other things in this list, which is why it's here.  To install it, simply run:

    $ /usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

In your terminal.  If you would like to read more about what it's doing, you can check out the [official installation instructions](https://github.com/mxcl/homebrew/wiki/installation).

[Memcached](http://memcached.org/)
----------------------------------

[Memcached](http://memcached.org/) is the software NVI app uses to cache all of the various page fragments so that the website can be as snappy and responsive as possible.  This isn't required for your development environment, but you will need to disable development caching in the `developent.rb` file by setting this:

    config.action_controller.perform_caching = false

I like to have it on, because I want to make sure that the caching is working as I expect it to, and because some of the DB queries are quite intensive and can lead to some long page loads.

But on to the installation, all you need to run is:

    $ brew install memcached

And you should be good to go.

Ruby
----

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

[Bundler](http://gembundler.com/)
---------------------------------

[Bundler](http://gembundler.com/) is a gem depencency manager, which is used by Rails since Rails 3.  It can be easily installed with:

    $ gem install bundler

With that installed, you can easily install all of the gem dependencies of the NVI app by running `bundle install` inside of the NVI directory.  This will look at the `Gemfile` and the `Gemfile.lock` to figure out what needs to be installed.  Anytime you add or remove a dependency in the `Gemfile`, you need to run `bundle` to have it rebuild the `Gemfile.lock`.

[Rails](http://rubyonrails.org/)
--------------------------------

[Rails](http://rubyonrails.org/) is the development framework the NVI is built with.  To install Rails, all you need to run is:

    $ gem install rails

I won't go into too much detail about Rails, because it's huge and I'll never be able to cover everything in the short guide, but one of the big things you'll use with it is `rails console` or just `rails c` which will start up a Rails console for your application.  You also use it to generate new controllers and models with `rails generate` or just `rails g`.

For help with all things Rails, I suggest you take a look at [Railscasts](http://railscasts.com/)

[Heroku](http://heroku.com/)
----------------------------

[Heroku](http://heroku.com/) is the cloud application platform that NVI is currently hosted on.  It is actually a specified dependency of NVI in the Gemfile, so just running `bundle` inside of the app directory should have installed the Heroku gem for you already.  If you want to check that you have it, run:

    $ heroku -v

And make sure that it outputs some version number.  If it is not installed, and you don't want to install all of the app dependencies right now, you can install the heroku gem with a simple:

    $ gem install heroku

The first time you run a command with it, you will have to provide your login credentials.  You'll want to login with an account that is either the Owner of the NVI app, or at least has development privileges for the NVI app.

You will also want to make sure to add the `heroku` remote to the git repository.  You can do that with this command: (make sure you're in the app's git repo)

    $ git remote add heroku git@heroku.com:new-venture-institute.git

The Heroku gem will let you control pretty much anything about the deployment.  For more info on what you can do with it, look at [Managing the Heroku Deployment](#managing-the-heroku-deployment).

* * *

A General Overview of How The App Works
=======================================

I'm going to have to skip over a lot of Rails basics so that this guide isn't too huge, but you should know that Rails uses the MVC model.  I'll split up the pieces by Models, Views, and Controllers.

Models
------

Most information about the models can be obtained by just looking at the code, but I will try and briefly describe the function of each model.

* [AdminUser](#adminuser)
* [Cart](#cart)
* [Instructor](#instructor)
* [Job](#job)
* [LineItem](#lineitem)
* [Location](#location)
* [MarketSector](#marketsector)
* [News](#news)
* [OnlineCourse](#onlinecourse)
* [OnlineLesson](#onlinelesson)
* [OnsiteCourse](#onsitecourse)
* [OnsiteCourseLocation](#onsitecourselocation)
* [OnsiteLesson](#onsitelesson)
* [OnsiteLessonLocation](#onsitelessonlocation)
* [User](#user)

###AdminUser

The `AdminUser` is what ActiveAdmin uses to store users who are allowed to edit the site.  You create a new `AdminUser` to allow someone new to access the backend.  To give someone new access to the backend, fire up a Rails console (locally: `rails c`, on heroku: `heroku run console`) and run the following commands:

    new_user = AdminUser.new
    new_user.email = "whatever@example.com"
    new_user.password = "secret"
    new_user.save

###Cart

The `Cart` is what stores all of the `LineItem`s.  A new `Cart` is created with each new visitor to the site, and it's ID is stored in the session.

###Instructor

The `Instructor` model stores the name, bio, and photo of the various instructors.  It also has relationships with `OnlineCourse`s, and `OnsiteCourseLocation`s.

###Job

The `Job` model is extremely bare bones.  It doesn't have any relationships with any of the other models.  It just stores a position, which is the name of the job position, a description, which is a description of the job position, and a contact email.  It also stores whether it is active or not, so jobs can be disabled from showing up in the views without having to delete them out of the database.

###LineItem

The `LineItem` represents something that can be place in the `Cart`.  It has a polymorphic association with `OnlineCourses`s, `OnlineLesson`s, `OnsiteCourse`s, and `OnsiteLesson`s.

###Location

`Location`s represent where different `OnsiteCourse`s are taught.

###MarketSector

`MarketSector`s are the sections of the site "Independent Study", "Corporate Education", and "University Education".  Be very careful about adding a new `MarketSector`, as it will immediately show up in the navigation and down in the footer.  The footer, for sure, can only handle displaying 3 market sectors with the way it's currently laid out.  Adding another one will likely cause a lot of the views to mess up.

`MarketSector`s have many `OnlineCourse`s and `OnsiteCourse`s.

###News

`News` represents the news items that show up on the top "News Update" bar.  They can also be seen on the News page.  The News Update bar will always show the latest published news item.

###OnlineCourse

`OnlineCourse`s belong to a `MarketSector`, have many `OnlineLesson`s, and belong to an `Instructor`.  The also have a description, a name, and a price.

###OnlineLesson

`OnlineLesson`s are where the lesson content actually goes.  The Articulate videos that get uploaded are tied to an `OnlineLesson`.  `OnlineLesson`s belong to an `OnlineCourse`.  They also have a description, a name, and a price.

###OnsiteCourse

`OnsiteCourse`s belong to a `MarketSector`, and have a many-to-many relationship with `Location`s.  The "join model" of that many-to-many relationship is the [`OnsiteCourseLocation`](#OnsiteCourseLocation).  `OnsiteCourse`s have a description, a name, a price, and a down payment price.

###OnsiteCourseLocation

`OnsiteCourseLocation`s represent the join model of the many-to-many relationship of `OnsiteCourse`s and `Location`s.  They also store the `Instructor`, because `OnsiteCourse`s will have different `Instructor`s at different `Location`s.

###OnsiteLesson

`OnsiteLesson`s belong to an `OnsiteCourse` and have a many-to-many relationship with `Location`s.  The "join model" of that many-to-many relationship is the [`OnsiteLessonLocation`](#OnsiteLessonLocation).  `OnsiteLesson`s have a description, a name, and a price.

###OnsiteLessonLocation

`OnsiteLessonLocation`s represent the join model of the many-to-many relationship of `OnsiteLesson`s and `Location`s.  They also store the seats remaining, as that will vary from location to location.

###User

The `User` model stores all of the users information.  We store their email, password (securely of course), their address info, and their credit card info through a stripe customer token.  `User`s have many of anything purchasable (`OnsiteCourse`, `OnlineLesson`, etc.) through `LineItem`s.

Views
-----

[coming soon]


Controllers
-----------

[coming soon]


* * *

How to Deploy
=============

Deploying a new version of the app to Heroku could not be easier.  Heroku uses git to deploy, so it all just works with a `git push heroku` (Make sure you've added the heroku remote to the git repository, as described [here](#heroku)).

So let's walk through a quick update.  Let's say we need to, I don't know, change all instances of New Venture Institute to New Venture Prep.  We'll do a project wide find and replace with

    $ find . -print | xargs sed -i 's/New Venture Institute/New Venture Prep/g'

Then we need to add those changes to be committed, and then commit those changes to git:

    $ git add .
    $ git commit -m "Changed all instances of New Venture Institute to New Venture Prep"

Now all we need to do is push that to Heroku:

    $ git push heroku

And it's all deployed.  Now due to caching, it might not appear to have updated on the site, so you might need to clear the cache.  To do that all you need to do is open up a Rails console on the heroku server:

    $ heroku run console

Then just use this command to clear the cache:

    Rails.cache.clear

And call `exit` to exit the Rails console.  After the cache has been cleared, it's usually a good idea to go to the site and visit all of the pages to get the caches rebuilt.  This step is optional though.

* * *

Managing the Heroku Deployment
==============================

* * *

If you need to contact me (Will Cosgrove) for any reason, about how something works, or why something isn't working, you can email me at [will@willcosgrove.com](mailto:will@willcosgrove.com).
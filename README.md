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

You will also want to make sure to add the `heroku` remote to the git repository.  You can do that with this command: (make sure you're in the app's git repo)

    $ git remote add heroku git@heroku.com:new-venture-institute.git

The Heroku gem will let you control pretty much anything about the deployment.  For more info on what you can do with it, look at [Managing the Heroku Deployment](#managing-heroku).

* * *

<a id="overview"></a>A General Overview of How The App Works
============================================================

First, allow me to appologize for the quality of the code.  This app was cowboy coded because of a few reasons:

* When I was first asked to build this application, it's scope was very small, and it did not appear to be very complicated.  I quoted it very low, because it was originally supposed to be 2 weeks of development.  The scope gradually grew more and more, and the development time extended past 2 months.  I never charged more because there was no original agreement on the scope of the application, which was my fault.  I won't make that mistake again.  Towards the end of the development, so many new things (that I didn't know had to be in this "alpha" version) came up, that I had to scrap the backend that I had originally been building off of, to have something to handle the new functionallity.  The majority of this new, last version was coded in 3 days.
* I had limited time to work on this app, and the more I worked on it, the further my hourly rate plummeted, so instead of spending the extra time to make the code as high of quality as it should be, I took shortcuts.
* I really believe that since this is only an "alpha", that it should be either completely rewritten, or at the least, dramatically overhauled, for the final release.  In it's current state, it is going to be too difficult to get new developers to work on it, and add new features.

So with my appology out of the way, let me get to how this thing works.

I'm going to have to skip over a lot of Rails basics so that this guide isn't too huge, but you should know that Rails uses the MVC model.  I'll split up the pieces by Models, Views, and Controllers.

Models
------

Most information about the models can be obtained by just looking at the code, but I will try and briefly describe the function of each model.

* [AdminUser](#AdminUserModel)
* [Cart](#CartModel)
* [Instructor](#InstructorModel)
* [Job](#JobModel)
* [LineItem](#LineItemModel)
* [Location](#LocationModel)
* [MarketSector](#MarketSectorModel)
* [News](#NewsModel)
* [OnlineCourse](#OnlineCourseModel)
* [OnlineLesson](#OnlineLessonModel)
* [OnsiteCourse](#OnsiteCourseModel)
* [OnsiteCourseLocation](#OnsiteCourseLocationModel)
* [OnsiteLesson](#OnsiteLessonModel)
* [OnsiteLessonLocation](#OnsiteLessonLocationModel)
* [User](#UserModel)

###<a id="AdminUserModel"></a> AdminUser

The `AdminUser` is what ActiveAdmin uses to store users who are allowed to edit the site.  You create a new `AdminUser` to allow someone new to access the backend.  To give someone new access to the backend, fire up a Rails console (locally: `rails c`, on heroku: `heroku run console`) and run the following commands:

    new_user = AdminUser.new
    new_user.email = "whatever@example.com"
    new_user.password = "secret"
    new_user.save

###<a id="CartModel"></a> Cart

The `Cart` is what stores all of the `LineItem`s.  A new `Cart` is created with each new visitor to the site, and it's ID is stored in the session.

###<a id="InstructorModel"></a> Instructor

The `Instructor` model stores the name, bio, and photo of the various instructors.  It also has relationships with `OnlineCourse`s, and `OnsiteCourseLocation`s.

###<a id="JobModel"></a> Job

The `Job` model is extremely bare bones.  It doesn't have any relationships with any of the other models.  It just stores a position, which is the name of the job position, a description, which is a description of the job position, and a contact email.  It also stores whether it is active or not, so jobs can be disabled from showing up in the views without having to delete them out of the database.

###<a id="LineItemModel"></a> LineItem

The `LineItem` represents something that can be place in the `Cart`.  It has a polymorphic association with `OnlineCourses`s, `OnlineLesson`s, `OnsiteCourse`s, and `OnsiteLesson`s.

###<a id="LocationModel"></a> Location

`Location`s represent where different `OnsiteCourse`s are taught.

###<a id="MarketSectorModel"></a> MarketSector

`MarketSector`s are the sections of the site "Independent Study", "Corporate Education", and "University Education".  Be very careful about adding a new `MarketSector`, as it will immediately show up in the navigation and down in the footer.  The footer, for sure, can only handle displaying 3 market sectors with the way it's currently laid out.  Adding another one will likely cause a lot of the views to mess up.

`MarketSector`s have many `OnlineCourse`s and `OnsiteCourse`s.

###<a id="NewsModel"></a> News

`News` represents the news items that show up on the top "News Update" bar.  They can also be seen on the News page.  The News Update bar will always show the latest published news item.

###<a id="OnlineCourseModel"></a> OnlineCourse

`OnlineCourse`s belong to a `MarketSector`, have many `OnlineLesson`s, and belong to an `Instructor`.  The also have a description, a name, and a price.

###<a id="OnlineLessonModel"></a> OnlineLesson

`OnlineLesson`s are where the lesson content actually goes.  The Articulate videos that get uploaded are tied to an `OnlineLesson`.  `OnlineLesson`s belong to an `OnlineCourse`.  They also have a description, a name, and a price.

###<a id="OnsiteCourseModel"></a> OnsiteCourse

`OnsiteCourse`s belong to a `MarketSector`, and have a many-to-many relationship with `Location`s.  The "join model" of that many-to-many relationship is the [`OnsiteCourseLocation`](#OnsiteCourseLocationModel).  `OnsiteCourse`s have a description, a name, a price, and a down payment price.

###<a id="OnsiteCourseLocationModel"></a> OnsiteCourseLocation

`OnsiteCourseLocation`s represent the join model of the many-to-many relationship of `OnsiteCourse`s and `Location`s.  They also store the `Instructor`, because `OnsiteCourse`s will have different `Instructor`s at different `Location`s.

###<a id="OnsiteLessonModel"></a> OnsiteLesson

`OnsiteLesson`s belong to an `OnsiteCourse` and have a many-to-many relationship with `Location`s.  The "join model" of that many-to-many relationship is the [`OnsiteLessonLocation`](#OnsiteLessonLocationModel).  `OnsiteLesson`s have a description, a name, and a price.

###<a id="OnsiteLessonLocationModel"></a> OnsiteLessonLocation

`OnsiteLessonLocation`s represent the join model of the many-to-many relationship of `OnsiteLesson`s and `Location`s.  They also store the seats remaining, as that will vary from location to location.

###<a id="UserModel"></a> User

The `User` model stores all of the users information.  We store their email, password (securely of course), their address info, and their credit card info through a stripe customer token.  `User`s have many of anything purchasable (`OnsiteCourse`, `OnlineLesson`, etc.) through `LineItem`s.

Views
-----

* Application
* Carts
* Instructor
* Jobs
* Line Items
* Locations
* Market Sectors
* News
* Online Courses
* Online Lessons
* Onsite Courses
* Onsite Course Locations
* Onsite Lessons
* Onsite Lesson Locations
* Pages
* User Sessons
* Users

Controllers
-----------

* Application
* Carts
* Instructor
* Jobs
* Line Items
* Locations
* Market Sectors
* News
* Online Courses
* Online Lessons
* Onsite Courses
* Onsite Course Locations
* Onsite Lessons
* Onsite Lesson Locations
* Pages
* User Sessons
* Users

* * *

<a id="deploying"></a>How to Deploy
===================================

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

<a id="managing-heroku"></a>Managing the Heroku Deployment
==========================================================

* * *

If you need to contact me (Will Cosgrove) for any reason, about how something works, or why something isn't working, you can email me at [will@willcosgrove.com](mailto:will@willcosgrove.com).
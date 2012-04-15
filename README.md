The Refuge : simple social networking for cool coworking places
===========
[![Travis](https://secure.travis-ci.org/la-cordee/refuge.png)](http://travis-ci.org/la-cordee/refuge)

The Refuge is a Ruby on Rails application that aims to help coworkers working with each other, and knowning each other better.

What it does :

* Recording and listing coworkers' profiles
* Sorting and finding members by social status, activity, name...
* Showing each member's profile in detailed views (social networks, activities, skills...)
* Allow members to post ads (buy, sell, collaborations propositions...)
* Checking actual occupation rate of the coworking place
* Checking news and actuality
* Propose surveys/pollings to you members
* Sharing Google agendas
* Checking meeting rooms occupation rate and disponibility
* Sending e-mail to other members

Extra-bonus feature :

* You can deal with multiples coworking places

It is NOT a one-more-kinda-social-app. The refuge doesn't have any internal messaging system, and your account must be first created by one of the admin user.
On the other hand, The Refuge tends to fit with associations and coworking places who need to coordinate and deal with dozains of members, and want to
share their profiles across each others inside a private, secure yet Web accessible portal.

Installation
----------------

Clone the repo :

`git clone git@github.com:la-cordee/refuge.git`

Install dependencies :

`bundle install`

Don't forget to fill-in your DataBase parameters in '/conf/database.yml',
then create the DB and populate it with a user, a configuration and a location :

`rake db:setup`

Done !

Usage
-----

Naviguate to your app's URL, then log in using the default account :

*email : admin@refuge.com*
*password : 123456*

Once logged in, you should change your password and personnal informations by visiting your own account.

By design, there is no real dedicated "admin interface". Each user can edit its own account by visiting its profile, and admins can edit all users.
As an admin, you can create/delete accounts, and you also have access to the admin tab, which allows you to customize your default avatar, create/update/delete places...

TODO
------
Tests, tests, tests


Author
------

* Guillaume Barillot (http://www.guillaume-barillot.com), with the highly appreciated help of 21croissants in the projet management.


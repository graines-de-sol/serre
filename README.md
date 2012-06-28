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
* Propose surveys/pollings to your members
* Sharing Google agendas
* Checking meeting rooms occupation rate and disponibility
* Sending e-mail across members

Extra-bonus feature :

* Wooohoo... you can also manage multiples coworking places at the same time !

It is NOT a one-more-kinda-social-app for the masses. The refuge doesn't have any internal messaging system, and your account must be first created by one of the admin user.
On the other hand, The Refuge tends to fit with non-profit organisations and coworking places who need to manage and deal with dozains of members who want to
share their profiles and know about each others' inside a private, secure yet Web accessible portal.

Installation
----------------

Clone or Fork the repo :

`git clone git@github.com:la-cordee/refuge.git && cd refuge`

Run the bootstrap script to check that you have all dependencies installed and set up a development environment:

`script/bootstrap`

Done !

Note
-----
You may also check your Mail server configuration, since the Refuge sends E-Mail across members and on account creations. Nonetheless, it is not required for application bootstrap.

Usage
-----

Naviguate to your app's URL, then log in using the default account :

*email : admin@refuge.com*

*password : 123456*

Once logged in, you should change your password and personnal informations by visiting your own account.

By design, there is no real dedicated "admin interface". Each user can edit its own account by visiting its profile, and admins can edit all users.
As an admin, you also have access to the admin top tab, which allows you to customize the default avatar, create/update/delete places, manage surveys...

TODO
------

* Translations (Actually French and English are supported but PR are welcome !)
* Tests, tests, tests


Author
------

* Guillaume Barillot (http://www.guillaume-barillot.com), with the highly appreciated help of 21croissants in the projet management.


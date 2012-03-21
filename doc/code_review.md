#CODE  REVIEW

##git

* sorry pr le massive merge
* valeur branch production?

##Code Review tools

###rails best practices

https://github.com/railsbp/rails_best_practices

Run with:
```
rails_best_practices --without-color > doc/rails_best_practices.txt
```

See result in doc/rails_best_practices.txt

###Code duplication Flay
http://ruby.sadi.st/Flay.html
```
flay **/*.rb
```
Result:

Total score (lower is better) = 123

1) Similar code found in :defn (mass = 72)
  app/controllers/admin_controller.rb:35
  app/controllers/admin_controller.rb:62
  app/controllers/admin_controller.rb:94

2) Similar code found in :defn (mass = 51)
  app/controllers/admin_controller.rb:44
  app/controllers/a dmin_controller.rb:71
  app/controllers/admin_controller.rb:116


###Complexity flog
http://ruby.sadi.st/Flog.html

```
find . -name \*.rb  | xargs flog
```
Result:

```
  1227.1: flog total
     9.8: flog/method average

   214.4: main#none
    46.9: MembersController#update         ./app/controllers/members_controller.rb:56
    39.7: MembersController#mail_member    ./app/controllers/members_controller.rb:94
    32.5: DashboardController#update       ./app/controllers/dashboard_controller.rb:50
    31.2: DashboardController#index        ./app/controllers/dashboard_controller.rb:8
    28.9: Network::with_urls               ./app/models/network.rb:10
    28.4: DashboardController#create       ./app/controllers/dashboard_controller.rb:33
    26.7: Survey::results                  ./app/models/survey.rb:11
    22.5: Profile::update                  ./app/models/profile.rb:7
    19.5: MembersController#show           ./app/controllers/members_controller.rb:24
    18.5: ApplicationHelper#avatar         ./app/helpers/application_helper.rb:109
    17.8: MembersController#create         ./app/controllers/members_controller.rb:42
    17.1: ApplicationHelper#birthday       ./app/helpers/application_helper.rb:89
    16.5: Article#strip_calendar_snippet   ./app/models/article.rb:11
    16.3: ApplicationHelper#translate_to_client ./app/helpers/application_helper.rb:36
    15.0: PagesController#update           ./app/controllers/pages_controller.rb:33
    14.9: ApplicationHelper#gauge          ./app/helpers/application_helper.rb:118
    14.4: MembersController#search         ./app/controllers/members_controller.rb:15
    14.3: Member#none
    13.2: Survey::vote                     ./app/models/survey.rb:26
```
###Complexity cane

https://github.com/square/caner
require ruby 1.9!

```
rvm use 1.9.3
cane --abc-glob '{lib,app}/**/*.rb' --abc-max 15
```
Result:

Methods exceeded maximum allowed ABC complexity (2):

  app/controllers/members_controller.rb    MembersController > update   20
  app/controllers/dashboard_controller.rb  DashboardController > index  19


### Static analysis
http://simplabs.github.com/excellent/

```
excellent app
```

No interesting result

## Security
http://brakemanscanner.org/

```
brakeman > doc/brakeman.txt
```

Result in doc/brakeman.txt.
Example: Possible SQL injection near line 16

##Some thoughts and ideas

* more orally ;)
* Refactor fat controllers
* Apply the Single Responsability principle
* remove comments such as "check if member has filled in some infos" for "def member_has_infos?(member)"
* use a library such as https://github.com/Squeegy/rails-settings instead of global variable $conf
* use http://code.rapportive.com/ to retrieve social networks info automatically
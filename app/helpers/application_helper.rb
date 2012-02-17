module ApplicationHelper

  # Say hello
  def hello
    Time.now.hour > 18 ? t(:good_evening) : t(:good_morning)
  end

  # Left menu tabs, remove/add you own here
  def tabs
    tabs = [
      {:name       => 'dashboard',
       :icon       => 'icon-home',
       :controller => 'dashboard'
      },
      {:name       => 'members',
       :icon       => 'icon-search',
       :controller => 'members'
      },
      {:name       => 'messages',
       :icon       => 'icon-envelope',
       :controller => 'messages'
      },
      {:name       => 'account',
       :icon       => 'icon-user',
       :controller => 'accounts'
      }
    ]
  end

  # Which role are you playing ?
  def is_admin
    current_user.role == 'admin' ? true : false  # TODO You can probably safely remove the ? true : false
  end

  # Can we show forms ?  TODO Why the method name has a different name? Please rename or remove the comment
  def can_edit_member
    # TODO Refactor => this is a crude copy paste from MembersController#show , please DRY
    # TODO Refactor => If you were unit testing your helpers, you would extract curent_user to a metthod param
    # TODO Refactor => Keep Your Views STUPID! Extract this logic to the User model
    (current_user.role == 'admin' || current_user.member.id == @member.id)? true : false
  end

end


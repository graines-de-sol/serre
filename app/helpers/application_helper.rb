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
    current_user.role == 'admin' ? true : false
  end

  # Can we show forms ?
  def can_edit_member
    (current_user.role == 'admin' || current_user.member.id == @member.id)? true : false
  end

end


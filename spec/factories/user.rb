FactoryGirl.define do
  factory :user do
    email { FactoryGirl.generate(:email) }
    password "testing"
    password_confirmation "testing"
    role 'user'
    factory :admin do
      role 'admin'
      view_as_user false
    end
  end
end

FactoryGirl.define do
  factory :user do
    email { FactoryGirl.generate(:email) }
    password "testing"
    password_confirmation "testing"

    member
  end
end


FactoryGirl.define do
  sequence :name do |n|
    "name #{n}"
  end

  sequence :email do |n|
    "testing#{n}@example.com"
  end
end

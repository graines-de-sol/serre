FactoryGirl.define do
  factory :survey do
  	factory :question do
  		parent_id 0
  		voters []
  	end
  	factory :answer do
  		parent {FactoryGirl.create(:question)}
  		voters []
  	end
  end
end

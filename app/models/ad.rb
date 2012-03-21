class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member
end


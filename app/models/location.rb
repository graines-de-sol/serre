class Location < ActiveRecord::Base
  has_many :members
  has_many :surveys
end


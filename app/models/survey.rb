class Survey < ActiveRecord::Base

  belongs_to :location

  acts_as_tree :order => 'id', :dependent=>:destroy

end


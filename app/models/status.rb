class Status < ActiveRecord::Base

  set_table_name "status"
  has_one :member
end


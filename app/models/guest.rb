class Guest < ActiveRecord::Base
  belongs_to :dining_table
  attr_accessible :email, :name, :note, :phone, :dining_table_id
end

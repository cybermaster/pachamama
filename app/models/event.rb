class Event < ActiveRecord::Base
  has_many :users, :through => :dining_tables
  
  validates_presence_of :date, :location
end

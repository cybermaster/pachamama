class Event < ActiveRecord::Base
  has_many :guests, :through => :dining_tables
  has_many :dining_tables  
  #validates_presence_of :date, :location
end

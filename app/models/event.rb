class Event < ActiveRecord::Base
  has_many :guests, :through => :dining_tables
  has_many :dining_tables  
  #validates_presence_of :date, :location
 
   def table_captains
     ans = Set.new 
     self.dining_tables.each {|t| ans << t.user.name unless t.user.blank?}
     ans
   end
end

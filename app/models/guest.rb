class Guest < ActiveRecord::Base
  belongs_to :dining_table
 
  attr_accessible :email, :first_name, :last_name, 
   :note, :phone, :dining_table_id

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :uniqueness => true

  def name
    "#{first_name } #{last_name}"
  end
 
  def event_name
    dining_table.try(:event).try(:name)
  end
      
  def group_number
    dining_table.try(:group_number)
  end
      
  def table_captain
    dining_table.try(:user).try(:name)
  end
      
  def table_hostname
    dining_table.try(:table_leader).try(:name)
  end
      
  def table_number
    dining_table.try(:physical_number)
  end
    
  def confirmed?
    true #TEMP
  end
end

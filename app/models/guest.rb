class Guest < ActiveRecord::Base
  belongs_to :dining_table
  attr_accessible :email, :first_name, :last_name, :note, :phone, :dining_table_id

  def first_namelast_name
    name = first_name + " " + last_name
    return name
  end
end

class DiningTable < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :guests
  
  validates_presence_of :group_number#, :physical_number I don't think we need this becuase they dont assign until end
  validates_uniqueness_of :group_number, :physical_number
  
  validate :validate_num_users

  def validate_num_users
    errors.add(:guests, "too many users in one table!") if guests.length > 12
  end
  
end

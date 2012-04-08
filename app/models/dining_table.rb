class DiningTable < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :users
  
  validates_presence_of :group_number, :physical_number
  validates_uniqueness_of :group_number, :physical_number
  
  validate :validate_num_users

  def validate_num_users
    errors.add(:users, "too many users in one table!") if users.length > 12
  end
  
end

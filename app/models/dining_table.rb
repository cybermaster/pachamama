class DiningTable < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :guests
  has_one :table_leader
  attr_accessible :table_leader, :physical_number, :group_number,:user_id, :event_id, :table_leader_id, :seats
  
  validates_presence_of :group_number#, :physical_number I don't think we need this because they dont assign until end
  #validates_uniqueness_of :group_number, :physical_number
  
  validate :validate_num_users

  def validate_num_users
    if guests.count > seats.to_i
      errors.add(:guests, "too many users in one table")
    end

  end
  
  def assigned?
    false #TODO
  end
  
end

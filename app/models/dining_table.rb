class DiningTable < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :guests
  attr_accessible :table_leader, :physical_number, :group_number,:user_id, :event_id, :table_leader_id, :seats
  after_create :set_seats
  validates_presence_of :group_number#, :physical_number I don't think we need this because they dont assign until end
  #validates_uniqueness_of :group_number, :physical_number
  
  validate :validate_num_users

  def validate_num_users
    if guests.count > seats.to_i
      errors.add(:guests, "too many users in one table")
    end

  end
  
  def table_leader
    Guest.find_by_id(table_leader_id)
  end
  
  def assigned?
  #is this correct?
    guests.count >= seats.to_i
  end
  
  def set_seats
    self.update_attribute :seats,event.default_seats_per_table if !seats && event 
  end
  
end

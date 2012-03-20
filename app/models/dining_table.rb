class DiningTable < ActiveRecord::Base
  belongs_to :admin
  belongs_to :tableCaptain
  has_many :guests
  validate :check_guest_limit
  validate :groupNumber, :presents => true, :uniqueness => true
  validate :tableNumber, :presents => true, :uniqueness => true

  def check_guest_limit
    errors.add("Your table is full, please request for another table to add another guest.") if :guests.count > 12
  end
end

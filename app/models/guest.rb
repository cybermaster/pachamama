class Guest < ActiveRecord::Base
  belongs_to :diningTable
  belongs_to :tableCaptain
  validate :firstName, :presents => true
  validates_uniqueness_of :firstName, :phone, :email, :scope => :lastName
end

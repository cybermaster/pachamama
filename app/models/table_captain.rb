class TableCaptain < ActiveRecord::Base
  has_and_belongs_to_many :admins
  has_many :dining_tables
  has_many :guests
  validate :firstName, :presents => true
  validate :password, :presents => true
  validate :email, :presents => true
  validates_uniqueness_of :email
end

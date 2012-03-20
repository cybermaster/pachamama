class TableCaptain < ActiveRecord::Base
  has_and_belongs_to_many :admins
  has_many :dining_tables
  has_many :guests
  validate :name, :presents => true
  validate :password, :presents => true
  validate :login, :presents => true
end

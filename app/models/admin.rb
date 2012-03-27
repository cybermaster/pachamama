class Admin < ActiveRecord::Base
  has_and_belongs_to_many :table_captains
  has_many :dining_tables
  validate :name, :presents => true
  validate :password, :presents => true
  validate :login, :presents => true
end

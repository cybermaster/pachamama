# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.create!(:name => "admin")
captain = Role.create!(:name => "captain")

puts 'SETTING UP DEFAULT Admin USER LOGIN'
user1 = User.create! :name => 'Admin User', :email => 'admin@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New Admin user created: ' << user1.name
user1.roles << admin

puts 'SETTING UP DEFAULT TableCaptain USER LOGIN'
user2 = User.create! :name => 'TableCaptain User', :email => 'tc@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New tableCaptain user created: ' << user2.name
user2.roles << captain

#remove this seed when we are in production
# DiningTable.create! :physicalNumber => '1' :groupNumber => '1', :user_id => admin1.id, :event_id => '1'
event = Event.create! :date => Date.civil(2012, 5, 5), :location => 'UC Berkeley', :name => 'UC Berkeley Lunch'
DiningTable.create! :physical_number => 1, :group_number => 1, :user_id => user1.id, :event_id => event.id


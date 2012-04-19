# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.create!(:name => "admin")
captain = Role.create!(:name => "captain")
guest = Role.create!(:name => "guest")

puts 'SETTING UP DEFAULT Admin USER LOGIN'
user1 = User.create! :name => 'Admin User', :email => 'admin@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New Admin user created: ' << user1.name
user1.roles << admin

puts 'SETTING UP DEFAULT TableCaptain USER LOGIN'
user2 = User.create! :name => 'TableCaptain User', :email => 'tc@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New tableCaptain user created: ' << user2.name
user2.roles << captain

puts 'SETTING UP DEFAULT guest USER LOGIN'
user3 = User.create! :name => 'Guest User', :email => 'guest@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New guest user created: ' << user3.name
user3.roles << guest
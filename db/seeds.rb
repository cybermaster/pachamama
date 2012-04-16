# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT Admin USER LOGIN'
admin1 = User.create! :name => 'First Admin User', :email => 'admin@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New Admin user created: ' << admin1.name
admin = Role.create! :name => "Admin"
admin.users << admin1

puts 'SETTING UP DEFAULT TableCaptain USER LOGIN'
tableCaptain1 = User.create! :name => 'First tableCaptain User', :email => 'tc@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New tableCaptain user created: ' << tableCaptain1.name
tableCaptain = Role.create! :name => "tableCaptain"
tableCaptain.users << tableCaptain1

puts 'SETTING UP DEFAULT guest USER LOGIN'
guest1 = User.create! :name => 'First guest User', :email => 'guest@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New guest user created: ' << guest1.name
guest = Role.create! :name => "guest"
guest.users << guest1
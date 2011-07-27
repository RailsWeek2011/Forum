# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create([{ name: 'Foobar'}, {name: 'Barfoo'}, {name: 'Blub', category_id: 1}])

user = User.create :email => "admin@a.de", :password => "123456", :password_confirm => "123456", :nick => "ADMIN", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now
user = User.first
user.roles = %w[admin]
user.save

user = User.create :email => "a@a.de", :password => "123456", :password_confirm => "123456", :nick => "BBKing", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now

user = User.create :email => "ab@a.de", :password => "123456", :password_confirm => "123456", :nick => "ChuckBerry", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now

user = User.create :email => "abc@a.de", :password => "123456", :password_confirm => "123456", :nick => "AngusYoung", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now

user = User.create :email => "abcd@a.de", :password => "123456", :password_confirm => "123456", :nick => "SRV", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now

user = User.create :email => "abcde@a.de", :password => "123456", :password_confirm => "123456", :nick => "GlennMiller", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now

user = User.create :email => "abcdef@a.de", :password => "123456", :password_confirm => "123456", :nick => "JimmyPage", :alive => true, :created_at => Time.now, :last_sign_in_at => Time.now

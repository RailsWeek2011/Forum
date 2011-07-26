# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create([{ name: 'Foobar'}, {name: 'Barfoo'}, {name: 'Blub', category_id: 1}])

user = User.create :email => "admin@a.de", :password => "123456", :password_confirm => "123456", :nick => "Gott"
user = User.first
user.roles = %w[admin]
user.save

user = User.create :email => "a@a.de", :password => "123456", :password_confirm => "123456", :nick => "Anton"

user = User.create :email => "ab@a.de", :password => "123456", :password_confirm => "123456", :nick => "Gustaf"

user = User.create :email => "abc@a.de", :password => "123456", :password_confirm => "123456", :nick => "Hans"

user = User.create :email => "abcd@a.de", :password => "123456", :password_confirm => "123456", :nick => "Edeltraut"

user = User.create :email => "abcde@a.de", :password => "123456", :password_confirm => "123456", :nick => "Michel"

user = User.create :email => "abcdef@a.de", :password => "123456", :password_confirm => "123456", :nick => "Georg"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#category = Category.create([{ name: 'Foobar'}, {name: 'Barfoo'}, {name: 'Blub', category_id: 1}])



category = Category.create :name  => "Level0"

category10 = Category.create :name => "Level1", :category_id => category.id
category11 = Category.create :name => "Level11", :category_id => category.id
category12 = Category.create :name => "Level12", :category_id => category.id

category200 = Category.create :name => "Level20 in 10", :category_id => category10.id
category210 = Category.create :name => "Level21 in 10", :category_id => category10.id


#TODO ADD SOME FREDS IN THERE!

fredin10 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 2, :category_id => category10.id
fredin10 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 3, :category_id => category10.id
fredin11 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 4, :category_id => category11.id
fredin11 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 2, :category_id => category11.id
fredin200 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 2, :category_id => category200.id
fredin200 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 5, :category_id => category200.id
fredin210 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 2, :category_id => category210.id
fredin12 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 4, :category_id => category12.id
fredin0 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 3, :category_id => category.id
fredin0 = Fred.create :headline  => "Just a Thread", :content => "This is me, Fred.", :user_id => 3, :category_id => category.id


#TODO ADD SIME POSTS IN THERE!

post = Post.create :user_id => 2, :fred_id => fredin0.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin10.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin11.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin200.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin210.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin12.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin0.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin10.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin10.id, :content => "Thats a Post!"
post = Post.create :user_id => 2, :fred_id => fredin200.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin12.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin12.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin12.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin0.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin0.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin10.id, :content => "Thats a Post!"
post = Post.create :user_id => 3, :fred_id => fredin10.id, :content => "Thats a Post!"
post = Post.create :user_id => 4, :fred_id => fredin11.id, :content => "Thats a Post!"
post = Post.create :user_id => 4, :fred_id => fredin11.id, :content => "Thats a Post!"
post = Post.create :user_id => 4, :fred_id => fredin200.id, :content => "Thats a Post!"
post = Post.create :user_id => 4, :fred_id => fredin210.id, :content => "Thats a Post!"
post = Post.create :user_id => 4, :fred_id => fredin11.id, :content => "Thats a Post!"
post = Post.create :user_id => 5, :fred_id => fredin10.id, :content => "Thats a Post!"
post = Post.create :user_id => 5, :fred_id => fredin0.id, :content => "Thats a Post!"
post = Post.create :user_id => 5, :fred_id => fredin10.id, :content => "Thats a Post!"


#TODO ADD SOME REPLIES

#nicht sehr intelligent, aber ich war zu faul mir hier was auszudenken, also:
#die tiefe der verschachtelung bestimmt die variable x, aber vorsicht! x = x * 2^n

n = 2
x = 0

while x < n
  posts = Post.all
  posts.each do |p|
    Post.create :user_id => p.user_id, :fred_id => p.fred_id, :content => "Thats a Reply!", :post_id => p.id
  end
  x = x+1
end








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

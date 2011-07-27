class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :fred
  
  scope :latest, order("created_at DESC").limit(10)
  
end

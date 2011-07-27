class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :fred
  
  validates :content, :presence => true, :length => {:minimum => 1}
  
  scope :latest, order("created_at DESC").limit(10)
  
end

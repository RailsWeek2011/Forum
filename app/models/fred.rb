class Fred < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts
  validates :headline, :presence => true, :length => {:minimum => 3, :maximum => 40}
end

class Fred < ActiveRecord::Base
  belongs_to :category
  has_many :posts
  validates :headline, :presence => true, :length => {:minimum => 3, :maximum => 40}
end

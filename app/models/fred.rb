class Fred < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts
  validates :headline, :presence => true, :length => {:minimum => 3, :maximum => 40}
  validates :content, :presence => true, :length => {:minimum => 1}
  
  def to_s
    self.headline
  end
end

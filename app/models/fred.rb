class Fred < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts
  validates :headline, :presence => true, :length => {:minimum => 3, :maximum => 40}
  validates :content, :presence => true, :length => {:minimum => 1}
  
  scope :latest, order("created_at DESC").limit(10)
  
  def to_s
    self.headline
  end

  def delete_context
    posts = Post.where(:fred_id => self.id)
    posts.each do |p|
      p.delete_context
    end
    self.destroy
  end
end

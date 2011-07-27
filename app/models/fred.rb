class Fred < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts
  validates :headline, :presence => true, :length => {:minimum => 3, :maximum => 40}
  validates :content, :presence => true, :length => {:minimum => 1}
  
  def to_s
    self.headline
  end

  def delete_fred_context
    posts = Post.where(:fred_id => self.id)
    unless posts.nil?
      posts.each do |p|
        p.delete_post_context
      end
    end
    self.destroy
  end
end

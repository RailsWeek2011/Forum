class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :fred
  
  validates :content, :presence => true, :length => {:minimum => 1}
  
  scope :latest, order("created_at DESC").limit(10)

  def delete_post_context
    posts = Post.where(:post_id => self.id)
    unless posts.nil?
      posts.each do |p|
        p.delete_post_context
      end
    end
    self.destroy
  end
  
end

class Category < ActiveRecord::Base
  belongs_to :category
  has_many :freds
  
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 40}, :uniqueness => true
  
  def to_s
    self.name
  end

  def delete_context
    cate = Category.where(:category_id => self.id)
    cate.each do |c|
      c.delete_context
    end
    fred = Fred.where(:category_id => self.id)
    fred.each do |f|
      f.delete_context
    end
    self.destroy
  end

end

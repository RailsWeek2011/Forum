class Category < ActiveRecord::Base
  belongs_to :category
  has_many :freds
  
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 40}, :uniqueness => true
  
  def to_s
    self.name
  end

  def delete_context
    cate = Category.where(:category_id => self.id)
    unless cate.nil?
      cate.each do |c|
        c.delete_context
      end
    end
    fred = Fred.where(:category_id => self.id)
    unless fred.nil?
      fred.each do |f|
        f.delete_fred_context
      end
    end
    self.destroy
  end

end

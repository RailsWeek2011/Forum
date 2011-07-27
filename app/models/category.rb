class Category < ActiveRecord::Base
  belongs_to :category
  has_many :freds
  
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 40}, :uniqueness => true
  
  def to_s
    self.name
  end
  
end

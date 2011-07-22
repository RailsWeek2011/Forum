class Category < ActiveRecord::Base
  belongs_to :category
  has_many :freds
  
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 70}, :uniqueness => true
  
end

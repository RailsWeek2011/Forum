class Fred < ActiveRecord::Base
  belongs_to :category
  
  validates :headline, :presence => true, :length => {:minimum => 3, :maximum => 40}
end

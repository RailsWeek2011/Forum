class Profile < ActiveRecord::Base
  belongs_to :user
  validates :nick, :presence => true, :length => {:minimum => 3, :maximum => 40}, :uniqueness => true
  validates :user_id, :uniqueness => true
end

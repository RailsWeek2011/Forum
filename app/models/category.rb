class Category < ActiveRecord::Base
  belongs_to :category
  has_many :freds
end

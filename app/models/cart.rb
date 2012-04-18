class Cart < ActiveRecord::Base
  attr_accessible :completed, :user_id
  has_many :line_items
  belongs_to :user
  
end

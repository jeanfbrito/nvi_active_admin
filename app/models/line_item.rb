class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :purchasable_id, :purchasable_type
  belongs_to :cart
  belongs_to :purchasable, polymorphic: true
end

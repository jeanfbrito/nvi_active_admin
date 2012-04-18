class Cart < ActiveRecord::Base
  attr_accessible :completed, :user_id
  has_many :line_items
  belongs_to :user

  scope :incomplete, where(completed: false)
  scope :complete, where(completed: true)

  def size
    self.line_items.count
  end

  def total
    total_in_pennies / 100.0
  end

  def total_in_pennies
    LineItem.where(cart_id: self.id).sum(:price_in_pennies)
  end

  def finalize
    #talk to stripe
    #set complete to true
    #email user
    #redirect back to user profile
  end
end

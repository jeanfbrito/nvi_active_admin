class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :country, :state, :zip_code, :phone_number,
                  :stripe_customer_id, :city, :email, :password, :password_confirmation,
                  :stripe_card_token
  attr_accessor :stripe_card_token

  validates_length_of :password, minimum: 6
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_uniqueness_of :email
  has_many :carts
  has_many :line_items, through: :carts
  has_many :online_courses, through: :line_items
  has_many :online_lessons, through: :line_items
  has_many :onsite_courses, through: :line_items
  has_many :onsite_lessons, through: :line_items
  
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def name=(full_name)
    split_name = full_name.split(' ', 2)
    self.first_name = split_name.first
    self.last_name = split_name.last
  end

  def credit_card_number
    stripe_customer = Stripe::Customer.retrieve(self.stripe_customer_id)
    "XXXX-XXXX-XXXX-#{stripe_customer["active_card"]["last4"]}"
  end

end

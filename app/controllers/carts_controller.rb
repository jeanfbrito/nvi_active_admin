class CartsController < InheritedResources::Base
  before_filter :require_login

  def index
    @cart = current_cart
  end

  def inspect_payment
    @cart = current_cart
    @user = current_user
  end

end

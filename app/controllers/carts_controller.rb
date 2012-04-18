class CartsController < InheritedResources::Base
  before_filter :require_login

  def index
    @cart = current_cart
  end

  def inspect_payment
    @cart = current_cart
    @user = current_user
  end

  def finalize
    @user = current_user
    @cart = current_cart
    unless @user.stripe_customer_token
      redirect_to :user_edit_payment, return_to: cart_finalize_path
    end
  end

end

class CartsController < InheritedResources::Base
  before_filter :require_login, only: [:finalize]
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
      session[:return_to_url] = cart_finalize_url if Config.save_return_to_url
      redirect_to edit_payment_user_url(@user)
    end
  end

  def charge
    @user = current_user
    @cart = current_cart
    @cart.finalize!
  end

end

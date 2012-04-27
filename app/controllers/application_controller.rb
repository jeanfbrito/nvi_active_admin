class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_cart
  before_filter :load_layout_requirements

  def current_cart
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
    elsif logged_in?
      cart = current_user.carts.incomplete.first || current_user.carts.create
      session[:cart_id] = cart.id
    else
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end

  def load_layout_requirements
    @current_news_headline = News.published.last
    @all_market_sectors = MarketSector.all
  end

  protected

  def not_authenticated
    redirect_to :login, :alert => "Please login or sign up first."
  end
end

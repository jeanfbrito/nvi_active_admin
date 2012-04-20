class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_cart
  before_filter :load_layout_requirements

  def current_cart
    current_user.carts.incomplete.first || current_user.carts.create
  end

  def load_layout_requirements
    @news_headline = News.published.last
    @market_sectors = MarketSector.all
  end
end

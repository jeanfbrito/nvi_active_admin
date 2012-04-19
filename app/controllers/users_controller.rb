class UsersController < ApplicationController
  before_filter :require_login, except: [:new, :create]

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      redirect_to users_path
    else
      render :new
    end
  end

  def edit_payment
    @user = current_user
  end

  def update_payment
    @user = current_user
    stripe_customer = Stripe::Customer.create(
      :email => @user.email,
      :description => "(#{@user.id}) #{@user.name}",
      :card => params[:stripe_card_token]
    )
    @user.stripe_customer_token = stripe_customer.id
    @user.save
    if params[:return_to]
      redirect_to params[:return_to]
    else
      redirect_to :users
    end
  end

end

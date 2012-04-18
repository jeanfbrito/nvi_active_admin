class UsersController < ApplicationController

  def index
  end

  def edit
    @user = current_user
  end

  def edit_payment
    
  end

  def update_payment
    if params[:return_to_url]
      redirect_to params[:return_to_url]
    else
      redirect_to :back
    end
  end

end

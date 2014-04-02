class SessionsController < ApplicationController

  def new
    redirect_to root if current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end

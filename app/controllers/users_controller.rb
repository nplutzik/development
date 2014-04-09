class UsersController < ApplicationController

  before_action :require_authentication, only: [:index, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # Only admins can create users while logged in
    require_admin_authentication if current_user
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

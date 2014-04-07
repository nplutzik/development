class UsersController < ApplicationController
  # What do you need to be logged in for to see ?
  before_action :require_authentication, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    # only admins can create users while logged in
    require_admin_authentication if current_user
    @user = User.new
  end

  def create
    # only admins can create users while logged in
    require_admin_authentication if current_user
    @user = User.new(user_params)
    @user.update(admin: false)
    if @user.save
      # user is logged in upon creation
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # Users can only edit themselves unless they are admins
    if current_user != @user
      redirect_to root_path unless current_admin
    end
  end

  def update
    @user = User.find(params[:id])
    # Users can only edit themselves unless they are admins
    if current_user != @user && !current_admin
      redirect_to root_path
    else
      if @user.update(user_params)
        redirect_to(@user)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    # Users can only delete themselves unless they are admins
    if current_user != @user && !current_admin
      redirect_to root_path
    else
      @user.destroy
      # Must be logged out if delete
      session[:user_id] = nil unless current_admin
      redirect_to(users_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end

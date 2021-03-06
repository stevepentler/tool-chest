class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account Created!" 
      redirect_to @user
    else
      flash[:notice] = "Invalid Account!"
      redirect_to new_user_path
    end
  end

  def show
    session[:hit_counter] = session[:hit_counter].to_i + 1
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end 
end 
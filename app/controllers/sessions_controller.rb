class SessionsController < ApplicationController
  def new
  end 

  def create
    user = User.find_by(username: params[:session][:username]) 
    if user
      user && user.authenticate(params[:session][:username])
      session[:user_id] = user.id
      flash[:notice] = "Welcome Back!"
      redirect_to user_path(user)
    else
      flash[:notice] = "Unsuccesful Login"
      redirect_to login_path
    end 
  end 

  def destroy
    session.clear
    redirect_to login_path
    flash[:notice] = "Logged Out!"
  end 
end 
class SessionsController < ApplicationController
  def new
  end 

  def create
    user = User.find_by(username: params[:session][:username]) 
    if user
    # if user && user.authenticate(params[:session][:username])
      user && user.authenticate(params[:session][:username])
      session[:user_id] = user.id
      flash[:notice] = "Welcome Back!"
      redirect_to user_path(user)
    else
    end 
  end 
end 
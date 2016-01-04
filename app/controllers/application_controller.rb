class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool
  #see set tool method
  def most_recent_tool
    Tool.find_by(id: session[:most_recent_tool_id])
  end 
end

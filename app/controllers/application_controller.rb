class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool
  before_action :initiate_session
  #see set tool method
  def most_recent_tool
    Tool.find_by(id: session[:most_recent_tool_id])
  end 

  def initiate_session #moved to application_controller
    session[:most_recent_tool_id]  = Tool.all.last.id
  end
  
end

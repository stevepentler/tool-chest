class ToolsController < ApplicationController #looks for tools folder in app views, and index file
  before_action :set_tool, only: [:show, :edit, :update, :destroy]       #to refactor @tool.find(params[:id])
  # before_action :initiate_session #moved to application_controller

  def index
    # session[:most_recent_tool_id]  = Tool.all.last.id
    @tools = Tool.all
  end 

  def show
    # @tool = Tool.find(params[:id])
  end

  def new
  end 

  def create
    @tool = Tool.create(tool_params) 
    # cookies[:most_recent_tool_id]  = @tool.id
    # session[:most_recent_tool_id]  = @tool.id
    
    flash[:notice] = "You've succesfully created a new tool"

    redirect_to tools_path #index
  end 

  def edit
    # @tool = Tool.find(params[:id])
  end 

  def update
    # @tool = Tool.find(params[:id])
    @tool.update(tool_params)

    redirect_to @tool
  end 

  def destroy
    # @tool = Tool.find(params[:id])
    @tool.destroy

    redirect_to tools_path
  end 

  private

  def set_tool 
    @tool = Tool.find(params[:id])
  end 

  def tool_params
    params.require(:tool).permit(:name, :use)
  end

  # def initiate_session #moved to application_controller
  #   session[:most_recent_tool_id]  = Tool.all.last.id
  # end

end 
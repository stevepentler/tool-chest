class ToolsController < ApplicationController #looks for tools folder in app views, and index file
  before_action :set_tool, only: [:show, :edit, :update, :destroy]       #to refactor @tool.find(params[:id])


  def index
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
    session[:most_recent_tool_id]  = @tool.id
    
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

end 
class ToolsController < ApplicationController #looks for tools folder in app views, and index file
  before_action :set_tool, only: [:show] #only: [:show, :edit, :update, :destroy] 
  before_action :set_user     #to refactor @tool.find(params[:id])
  # before_action :initiate_session #moved to application_controller

  def index
    
    @tools = @user.tools.all
    # session[:most_recent_tool_id]  = Tool.all.last.id
    # @tools = Tool.all
  end 

  def show
    # @tool = Tool.find(params[:id])
  end

  # def new
  #   @tool = @user.tools.new
  # end 

  # def create
  #   @tool = @user.tools.create(tool_params) 
  #     if @tool.save
  #       redirect_to user_tools_path
  #       flash[:notice] = "You've succesfully created a new tool"
  #     else 
  #       render :new
  #     end
  # end 

  # def edit
  #   # @tool = Tool.find(params[:id])
  # end 

  # def update
  #   # @tool = Tool.find(params[:id])
  #   @tool.update(tool_params)

  #   redirect_to user_tools_path
  # end 

  # def destroy
  #   # @tool = Tool.find(params[:id])
  #   @tool.destroy

  #   redirect_to user_tools_path
  # end 

  private

  def set_tool 
    @tool = Tool.find(params[:id])
  end 

  def set_user
    @user = User.find(params[:user_id])
  end 

  def tool_params
    params.require(:tool).permit(:name, :use)
  end

  # def initiate_session #moved to application_controller
  #   session[:most_recent_tool_id]  = Tool.all.last.id
  # end

end 
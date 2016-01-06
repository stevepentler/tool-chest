class Admin::ToolsController < Admin::BaseController
  before_action :set_tool, only: [:show]
  # before_action :set_user, only: [:show]
  
  def index
    @tools = Tool.all
    # @user = @tool.user_id
  end

  def show
  end

  def edit
  end

  private

  def set_tool 
    @tool = Tool.find(params[:id])
  end 

  def set_user
    # @user = User.find(params[:user_id])
  end 

  def tool_params
    params.require(:tool).permit(:name, :use)
  end

end




class Admin::ToolsController < Admin::BaseController
  before_action :set_tool, only: [:show, :create]
  # before_action :set_user, only: [:show]
  
  def index
    @tools = Tool.all
    # @user = @tool.user_id
  end

  def show
  end

  def edit
  end

  def new
    @tool = Tool.new
  end 

  def create
  @tool = Tool.create(tool_params) 
    if @tool.save
      redirect_to admin_tools_path
      flash[:notice] = "You've succesfully created a new tool"
    else 
      render :new
    end
  end 

  private

  def set_tool 
    # @tool = Tool.find(params[:id])
  end 

  def set_user
    # @user = User.find(params[:user_id])
  end 

  def tool_params
    params.require(:tool).permit(:name, :use, :user_id)
  end

end




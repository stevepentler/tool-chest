class Admin::ToolsController < Admin::BaseController
  # before_action :set_tool, only: [:show, :create]
  # before_action :set_user, only: [:show]
  
  def index
    @tools = Tool.all
    # @user = @tool.user_id
  end

  def show
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    redirect_to admin_tools_path
  end 

  def new
    @tool = Tool.new
  end 

  def create
    @user = User.find_by(user_name: params[:tool][:user])
    if @user
      @tool = @user.tools.create(tool_params)
    end 

  @tool = Tool.create(tool_params) 
    if @tool.save
      redirect_to admin_tools_path
      flash[:notice] = "You've succesfully created a new tool"
    else 
      render :new
    end
  end 

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy

    redirect_to admin_tools_path
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




class Admin::ToolsController < Admin::BaseController

  def index
    @tools = Tool.all
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

  def tool_params
    params.require(:tool).permit(:name, :use, :user_id)
  end

end




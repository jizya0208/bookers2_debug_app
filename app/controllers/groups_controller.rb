class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user    #グループ作成者を加入
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
    redirect_to groups_path
  end
  
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group.update(group_params)
    @group.save
    redirect_to groups_path
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :describe, :group_image)
  end
end

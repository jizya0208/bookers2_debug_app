# groupsコントローラにjoin, destroyメソッド追加で対応可能。


# class GroupUsersController < ApplicationController
#   def create
#     group_user = GroupUser.new(group_user_params)
#     group_user.user_id = current_user.id
#     group_user.save
#     redirect_to groups_path
#   end
  
#   def destroy
#     group_user = GroupUser.find_by(user_id: current_user.id, group_id: params[:group_id])
#     group_user.destroy
#     redirect_to groups_path
#   end
  
#   private
#   def group_user_params
#     params.permit(:group_id)
#   end
# end



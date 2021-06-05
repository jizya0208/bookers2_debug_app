class MessagesController < ApplicationController
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).exists?
      @message = Message.new(message_params)
      if @message.save
        redirect_to "/rooms/#{@message.room_id}"
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end
end

#   def create
#     if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
#       @message = Message.new(message_params)
#       if @message.save
#         redirect_to "/rooms/#{@message.room_id}"
#       else
#         redirect_back(fallback_location: root_path)
#       end
#     end

#     private 
#     def message_params
#         params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
#     end
#   end
# end

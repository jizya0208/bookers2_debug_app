class RoomsController < ApplicationController
 def create
    @room = Room.create   #既存ルームがない場合に新規作成
    current_entry = Entry.create(user_id: current_user.id, room_id: @room.id) #EntryモデルからDM送信側のentryインスタンス生成
    another_entry = Entry.create((entry_params).merge(room_id: @room.id)) #DM受信側のentryインスタンス生成。
    redirect_to room_path(@room) #room詳細ページへ遷移
  end
  
  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).exists?
      @messages = @room.messages
      @message = Message.new
      entries = @room.entries
      if entries[0].user_id == current_user.id
        @name = User.find(entries[1].user_id).name
      else
        @name = User.find(entries[0].user_id).name
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private 
  def entry_params
    params.require(:entry).permit(:user_id, :room_id)
  end
 
end
 

#   def create
#     @room = Room.create
#     Entry.create(room_id: @room.id, user_id: current_user.id)      
#     Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
#     redirect_to "/rooms/#{@room.id}"
#   end

#   def show
#     @room = Room.find(params[:id])
#     if Entry.where(user_id: current_user.id, room_id: @room.id).present?
#       @messages = @room.messages.all
#       @message = Message.new
#       @entries = @room.entries
#     else
#       redirect_back(fallback_location: root_path)
#     end
#   end
# end
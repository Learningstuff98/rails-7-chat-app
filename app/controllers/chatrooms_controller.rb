class ChatroomsController < ApplicationController
  def create
    @chatroom = Chatroom.create(chatroom_params)
    if @chatroom.save
      redirect_to root_path, notice: "Chatroom created!"
    else
      redirect_to root_path, notice: "Chatroom names can't be blank."
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @comment = Comment.new
    @comments = @chatroom.comments
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end

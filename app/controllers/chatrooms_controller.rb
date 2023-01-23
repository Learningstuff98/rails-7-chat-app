class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.create(chatroom_params)
    redirect_to root_path
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

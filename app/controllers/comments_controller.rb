class CommentsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to chatroom_path(@chatroom) }
      Turbo::StreamsChannel.broadcast_update_to(
        "chatroom_channel",
        partial: "chatrooms/comments",
        target: "target",
        locals: {comments: @chatroom.comments}
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

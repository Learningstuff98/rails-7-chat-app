class CommentsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom.comments.create(comment_params)
    handle_response(@chatroom)
  end

  def edit
    @comment = current_comment
  end

  def update
    @comment = current_comment
    @comment.update(comment_params)
    handle_response(@comment.chatroom)
  end

  private

  def current_comment
    @current_comment ||= Comment.find(params[:id])
  end

  def handle_response(chatroom)
    respond_to do |format|
      format.html { redirect_to chatroom_path(chatroom) }
      Turbo::StreamsChannel.broadcast_update_to(
        "chatroom_channel_#{chatroom.id}",
        partial: "chatrooms/comments",
        target: "target",
        locals: {comments: chatroom.comments}
      )
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class CommentsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @comment = @chatroom.comments.create(comment_params)
    redirect_to chatroom_path(@chatroom)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: @prototype.id)
  end
end

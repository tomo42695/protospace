class CommentsController < ApplicationController
  before_action :set_prototype
  def create
    Comment.create(comment_params)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: @prototype.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments
  end
end

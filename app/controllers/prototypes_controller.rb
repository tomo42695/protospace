class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    prototype = Prototype.new(prototype_params)
    prototype.save
    flash[:notice] = "投稿が完了しました"
    redirect_to action: :index
  end

  private
  def prototype_params
    params.require(:prototype).permit(:id, :title, :text, :catchcopy, :concept, prototype_images_attributes: [:id, :content, :role]).merge(user_id: current_user.id)
  end
end

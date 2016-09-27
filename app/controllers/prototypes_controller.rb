class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @main_content = @prototype.prototype_images.build
  end

  def create
    @main_content.save
    redirect_to action: :index
  end

  def prototype_params
    params.require(:prototype).permit(:title, :text, :catchcopy, :concept).merge(user_id: current_user.id)
  end

  def prototype_image_params
    params.require(:prototype_image).permit(:content, :role).merge(prototype_id: params[:prototype_id])
  end
end

class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:update, :destroy, :show, :edit]
  def index
    @prototypes = Prototype.includes(:prototype_images).order(created_at: :desc).page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def show
    @like = Like.find_by(prototype_id: @prototype.id)
    if current_user
      @comment = Comment.new(prototype_id: @prototype.id, user_id: current_user.id)
    end
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      flash[:notice] = "Create Success"
      redirect_to action: :index
    else
      flash[:alert] = "Could Not Create"
      render action: :new
    end
  end

  def edit
    @prototype.prototype_images.build
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.user.id == current_user.id
      @prototype.destroy
    end
    redirect_to action: :index
    flash[:notice] = "Successfully Deleted"
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.user.id == current_user.id
      @prototype.update(prototype_params)
    end
    redirect_to action: :index
    flash[:notice] = "Successfully Edited"
  end

  private
  def set_prototype
      @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:id, :title, :text, :catchcopy, :concept, prototype_images_attributes: [:id, :content, :role]).merge(user_id: current_user.id)
  end
end

class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    redirect_to action: :index
  end

  def prototype_params
    params.permit(:title, :text, :catchcopy, :concept)
  end
end

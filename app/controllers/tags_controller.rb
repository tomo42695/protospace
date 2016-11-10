class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag = params[:id]
    @prototypes = Prototype.tagged_with(params[:id])
  end
end

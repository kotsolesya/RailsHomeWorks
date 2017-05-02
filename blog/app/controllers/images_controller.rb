class ImagesController < ApplicationController
  before_filter :load_imageable

  def index
    @images = @imageable.images
  end

  def new
    @image = @imageable.images.new
  end

  def create
    @image = @imageable.images.new(params[:image])
    if @image.save
      redirect_to @imageable, notice: 'Comment created.'
    else
      render :new
    end
  end

  private

  def load_imageable
    resource, id = request.path.split('/')[1, 2]
    @imageable = resource.singularize.classify.constantize.find(id)
  end
end

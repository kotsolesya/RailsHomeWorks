class PostsController < ApplicationController
  before_filter :authorize
  before_filter :set_post, only: [:update, :edit, :destroy]

  def index
    #@posts ||= Post.order('created_at DESC')
    @posts = Post.paginate(:page => params[:page]).order('created_at DESC')
    @post = Post.new
    respond_to do |format|
      format.html
      format.js { render 'shared/post_page' }
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @imageable = @post
    @images = @imageable.images
    @image = Image.new
  end

  def create
    @post = current_user.posts.create(params[:post])
    respond_to do |format|
      format.html { render(:new) }
      format.js
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.js
      else
        format.html { render action: 'edit' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post.destroy
  end

  private
  def set_post
    @post = current_user.posts.find(params[:id])
  end

end

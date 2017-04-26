class PostsController < ApplicationController
  before_filter :authorize
  before_filter :set_post, only: [:update, :edit, :destroy]

  def index
    @posts ||= Post.order('created_at DESC')
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(params[:post])
    respond_to do |format|
      format.html { render(:new) }
      format.js
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to root_url, notice: 'Successful update'
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @post.destroy
  end

  private
  def set_post
    @post = current_user.posts.find(params[:id])
  end

end

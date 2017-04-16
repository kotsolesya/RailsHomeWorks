# controller
class UsersController < ApplicationController
  def index
    order = params[:order] || 'asc'
    @users = User.order("id #{order}")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: 'Signed up!'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_url, notice: 'Successful update'
    else
      render 'edit'
    end
  end
end

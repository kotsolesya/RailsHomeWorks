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
end

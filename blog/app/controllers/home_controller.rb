class HomeController < ApplicationController
  # skip_before_filter :check_auth, only: [:index]
  # before_filter :book, only: [:show, :edit, :update, :destroy]
  # before_filter :book, skip: [:new, :create, :index]
  def index
    order = params[:order] || 'asc'
    @users = User.order("id #{order}")
  end
end

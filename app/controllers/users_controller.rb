class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Money Manager!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    if signed_in?
      @user = User.find(params[:id])
      render 'show'
    else
      redirect_to root_url
    end
  end
end

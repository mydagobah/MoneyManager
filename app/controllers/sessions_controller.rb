class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      @money = Money.find_by_user_id(user.id)
      redirect_to :controller => 'money', :action => 'list'
    else
      flash.now[:error] = "Invalid Email/Password combination"
      render 'welcome/index'
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end
end

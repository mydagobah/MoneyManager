class WelcomeController < ApplicationController
  def index
    if signed_in?
      redirect_to controller: 'money', action: 'list'
    else
      render 'index'
    end
  end

  def about
    render 'about'
  end
end

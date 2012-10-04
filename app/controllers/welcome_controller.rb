class WelcomeController < ApplicationController
  def index
    if signed_in?
      render 'money/index' 
    end
  end

  def about
    render 'about'
  end
end

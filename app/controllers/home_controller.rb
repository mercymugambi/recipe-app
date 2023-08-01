class HomeController < ApplicationController
  def index
    @current_user = if user_signed_in?
      current_user.name
    end
  end
end

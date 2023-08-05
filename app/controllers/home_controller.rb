class HomeController < ApplicationController
  def index
    @current_user = (current_user.name if user_signed_in?)
  end
end

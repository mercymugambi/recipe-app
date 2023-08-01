class HomeController < ApplicationController
  def index
    if_signed_in? do |current_user|
      @user_name = current_user.name
    end
    @user_name ||= "Guest"
  end
end

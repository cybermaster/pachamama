class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current_user = current_user

    if current_user.role?("Admin")
      @events = Event.all
    else
      @events = Event.all
      #@event = Event.where("user_id = ?", current_user.id)
    end


  end
end

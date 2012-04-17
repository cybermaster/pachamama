class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @current_user = current_user

    if current_user.role?("Admin")
      @dining_tables = DiningTable.all
    else
      @dining_tables = DiningTable.where("user_id = ?", current_user.id)
    end


  end
end

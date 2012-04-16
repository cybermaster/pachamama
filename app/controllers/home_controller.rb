class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @diningTables = DiningTable.all

  end
end

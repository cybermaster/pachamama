class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  
  def show
    @admin = Admin.all
  end
  
end

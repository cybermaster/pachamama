class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @admin = Admin.all
  end
  
end

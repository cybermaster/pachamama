class DiningTablesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  def index
    @dining_tables = DiningTable.all
  end

  def show
    @dining_table = DiningTable.find(params[:id])
  end

  def edit
    @dining_table = DiningTable.find(params[:id])
  end

  def new
    @dining_table = DiningTable.new
    @table_captains = User.all
  end



end

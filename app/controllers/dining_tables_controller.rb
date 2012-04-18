class DiningTablesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  def index
    @dining_tables = DiningTable.all
  end

  def show
    @dining_table = DiningTable.find(params[:id])
    @event = Event.find(@dining_table.event_id)
    @table_captain = User.find(@dining_table.user_id)
    @guests = @dining_table.guests
  end

  def edit
    @dining_table = DiningTable.find(params[:id])
  end

  def new
    @dining_table = DiningTable.new
    @dining_table.group_number = DiningTable.count + 1
    @table_captains = User.all
  end

  def create
    user_info = params[:user]
    dining_table_info = params[:dining_table]
    event_info = params[:event]
    @dining_table = DiningTable.new(:physical_number => dining_table_info[:physical_number],
                                    :group_number => dining_table_info[:group_number],
                                    :user_id => user_info[:id], :event_id =>event_info[:id] )

    if @dining_table.save
      redirect_to @dining_table, notice: 'Table was successfully added.'
    else
      render action: "new"
    end
  end

  def update
    user_info = params[:user]
    dining_table_info = params[:dining_table]
    #@dining_table = DiningTable.find(params[:id])
    @dining_table = DiningTable.find(params[:id])


    if @dining_table.update_attributes(:physical_number => dining_table_info[:physical_number],
                                       :group_number => dining_table_info[:group_number],
                                       :user_id => user_info[:user_id])

      redirect_to @dining_table, notice: 'Table was successfully updated.'
    else
      render action: "edit"
    end
  end
end
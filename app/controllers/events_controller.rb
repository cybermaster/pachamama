class EventsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    mm
    @users = User.all
    @current_user = current_user

    if current_user.role?("admin")
      @dining_tables = DiningTable.where("event_id = ")
    else
      @dining_tables = DiningTable.where("user_id = ?", current_user.id)
    end
  end

  def show
    @dining_tables = DiningTable.where("event_id = ?", params[:id])
    #@event = Event.find(@dining_table.event_id)
    #@table_captain = User.find(@dining_table.user_id)
    #@guests = @dining_table.guests
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    #@dining_table.group_number = DiningTable.count + 1
    #@table_captains = User.all
  end

  def create
    #@guest = Guest.new(:name => params[:name], :name => params[:email], :name => params[:email],
    #                   :note => params[:note],  :dining_table_id => params[:dining_table_id])
    @event = Event.new(params[:event])


    if @event.save
      # Todo fix line below with the "1"
      redirect_to root_path(), notice: 'Event was successfully added.'

    else
      render action: "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])

      redirect_to root_path, notice: 'Event was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path

  end
end

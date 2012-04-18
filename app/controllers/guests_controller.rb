class GuestsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def show
    @guest = Guest.find(params[:id])
    #@event = Event.find(@dining_table.event_id)
    #@table_captain = User.find(@dining_table.user_id)
    #@guests = @dining_table.guests
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
    #@dining_table.group_number = DiningTable.count + 1
    #@table_captains = User.all
  end

  def create
    #@guest = Guest.new(:name => params[:name], :name => params[:email], :name => params[:email],
    #                   :note => params[:note],  :dining_table_id => params[:dining_table_id])
    @guest = Guest.new(params[:guest])


    if @guest.save
      # Todo fix line below with the "1"
      redirect_to dining_table_path(@guest.dining_table_id), notice: 'Guest was successfully added.'

    else
      render action: "new"
    end
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])

      redirect_to @guest.dining_table, notice: 'Guest was successfully updated.'
    else
      render action: "edit"
    end
  end
end
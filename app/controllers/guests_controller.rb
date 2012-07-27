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
  end

  def create

    @guest = Guest.new(params[:guest])

    if @guest.save
      # Todo fix line below with the "1"
      redirect_to dining_table_path(@guest.dining_table_id), notice: 'Guest was successfully added.'
    else
     respond_to do |format|
      format.html { render :action => "new" }
      format.xml  { render :xml => @guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])

      redirect_to dining_table_path(@guest.dining_table), notice: 'Guest was successfully updated.'
    else
      respond_to do |format|
           format.html { render :action => "edit" }
      format.xml  { render :xml => @guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy

    @guest = Guest.find(params[:id])
    table = @guest.dining_table.id
    @guest.destroy

    redirect_to dining_table_path(table)

  end
end

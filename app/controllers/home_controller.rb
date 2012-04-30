class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current_user = current_user

    if current_user.role? :Admin
      @events = Event.all
    else
      @events = events_for_current_user
      #@event = Event.where("user_id = ?", current_user.id)
    end

  end

  def events_for_current_user
    dining_tables = DiningTable.where("user_id = ?", current_user.id)
    events = Set.new
    dining_tables.each do |dt|
      events.add(Event.find(dt.event_id))
    end

    return events
  end
end

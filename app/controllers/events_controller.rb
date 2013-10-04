class EventsController < ApplicationController
  protect_from_forgery

   def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end

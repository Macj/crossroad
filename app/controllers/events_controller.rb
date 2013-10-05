class EventsController < ApplicationController
  protect_from_forgery

   def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    puts params.inspect
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event)
    else
      flash[:error] =  @event.errors.to_s
      redirect_to :action => :edit
    end
  end  

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to event_path(@event)
    else
      flash[:error] =  @event.errors.to_s
      redirect_to :action => :new
    end    
  end
end

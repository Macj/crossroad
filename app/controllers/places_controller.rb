class PlacesController < ApplicationController
  protect_from_forgery

   def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    puts params.inspect
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      redirect_to place_path(@place)
    else
      flash[:error] =  @place.errors.to_s
      redirect_to :action => :edit
    end
  end  

  def create
    @place = Place.new(params[:place])
    if @place.save
      redirect_to place_path(@place)
    else
      flash[:error] =  @place.errors.to_s
      redirect_to :action => :new
    end    
  end
end

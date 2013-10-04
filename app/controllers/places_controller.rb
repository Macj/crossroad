class PlacesController < ApplicationController
  protect_from_forgery

   def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end
end

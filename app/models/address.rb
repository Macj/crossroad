#encoding: UTF-8
require 'google_geocoder'

class Address < ActiveRecord::Base
  attr_accessible :building, :city, :street, :lat, :lng

  def get_info
    unless self.lat || self.lng
      coordinates = GoogleGeocoder.get_coordinates(self)
      self.update_attributes(coordinates)
    end
    if self.lat && self.lng
      {:lat => self.lat, :lng => self.lng, :content => self.full }
    else
      nil
    end
  end

  def full
    ['Украина', "г\." + self.city, self.street, self.building].join(', ')
  end
end

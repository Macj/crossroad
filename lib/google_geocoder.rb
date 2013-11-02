require 'google_geocoder/sender'
require 'google_geocoder/settings'
require 'google_geocoder/parser'

module GoogleGeocoder
  def self.get_coordinates(address)
    response = Sender.send(address)
    # puts '@@@@@@@@', response.body.inspect
    handle_response( address, response.body )
  end

  private
    def self.handle_response address, response
      params = Parser.do(response)
      params
    end
end
#encoding: utf-8

require 'net/http'

module GoogleGeocoder
  class Sender
    def self.send address
      uri = Settings.uri( request_data(address) )
      response = Net::HTTP.get_response( uri )
      response
    end

    private
      def self.request_data address
        {
          "address"   => address.full,
          "sensor"   => 'false',
          "language" => 'ru'
        }
      end
  end
end
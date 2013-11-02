module GoogleGeocoder
  class Settings
    class << self

      def server
        'maps.googleapis.com/maps/api/geocode/json'
        #'10.1.2.7' for local office testing
      end

      def uri data
        uri = URI.parse("http://#{self.server}")
        uri.query = URI.encode_www_form( data )
        uri
      end

      def coord_request_url address_string
        "http://#{self.server}?address=#{address_string}&sensor=false&language=ru"
      end

      def address_request_url x, y
        URI.parse("http://#{self.server}?latlng=#{x},#{y}&sensor=false&language=ru")
      end
    end
  end
end
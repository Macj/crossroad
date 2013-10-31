#encoding: utf-8

module GoogleGeocoder
  class Parser
    def self.do json_data
      data = ActiveSupport::JSON.decode( json_data )
      # puts '##########', data
      response = data['results'].first
      if data['results']
        parse response
      else
        nil
      end
    end

    private
      def self.parse response
        # puts '!!!!!!!!!!', response.inspect
        location = response['geometry']['location']
        {:lat => location['lat'], :lng => location['lng']}
      end
  end
end
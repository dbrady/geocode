require 'net/http'
require 'json'

class GoogleGeocode
  attr_reader :api_key
  def initialize(api_key)
    @api_key = api_key
  end

  def do_geocode(location)
    url = "http://maps.google.com/maps/geo?sensor=false&key=#{@api_key}&output=json&q=#{location}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    
    result = JSON.parse(data)
    class << result
      def success?
        self["Status"]["code"] == 200
      end
      
      def error?
        !success?
      end
      
      def dump
        inspect
      end
      
      def latlng
        self["Placemark"][0]["Point"]["coordinates"][0..1].reverse
      end

      def address
        self["Placemark"][0]["address"]
      end
    end
    result
  end

  def geocode(location)
    # change whitespace to %20 for the URL
    result = do_geocode location.gsub(/\s+/, '%20')
  end
  
  
  def reverse_geocode(location)
    # reverse geocodes should not have any spaces in them
    result = do_geocode location.gsub(/\s+/, '')
  end
end

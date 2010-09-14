require 'net/http'
require 'yaml'

module Google
  class Geocode
    attr_reader :api_key
    def initialize(api_key, client)
      @api_key = api_key
      @client = client
    end

    def do_geocode(location)
      url = "http://maps.google.com/maps/geo?sensor=false&key=#{@api_key}&output=json&q=#{location}&client=#{@client}"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body

      Google::Result.new(data)
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
end

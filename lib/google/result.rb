require 'json'

# TODO: Refactor this up to an abstract parent class in ../result.rb
# so we can use e.g. Yahoo maps or Tiger/LINE data.

module Google
  class Result
    attr_accessor :data
    
    def initialize(data)
      @data = JSON.parse data
    end
    
    def success?
      data["Status"]["code"] == 200
    end
    
    def error?
      !success?
    end
    
    def dump
      data.to_yaml
    end
    
    def latlng
      data["Placemark"][0]["Point"]["coordinates"][0..1].reverse
    end

    def lat
      data["Placemark"][0]["Point"]["coordinates"][1]
    end

    def lng
      data["Placemark"][0]["Point"]["coordinates"][0].reverse
    end

    def address
      data["Placemark"][0]["address"]
    end

    def accuracy
      data["Placemark"][0]["AddressDetails"]["Accuracy"]
    end
    
    # returns viewport in tlbr format
    def viewport
      @vp ||= [:north, :west, :south, :east].map {|dir| data["Placemark"][0]["ExtendedData"]["LatLonBox"][dir.to_s] }
    end
    
    def viewport_height
      vp = viewport
      vs = (vp[0] - vp[2]) * ::Geocode::MILES_PER_DEGREE_LATITUDE
    end

  end
end

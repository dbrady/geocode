require File.expand_path(File.join(File.dirname(__FILE__), 'google', 'geocode'))
require File.expand_path(File.join(File.dirname(__FILE__), 'google', 'result'))
require File.expand_path(File.join(File.dirname(__FILE__), 'earth_constants'))

class Geocode
  include EarthConstants
  
  attr_reader :lat, :lng
  
  def self.new_geocoder(service, options)
    case service
    when :google
      Google::Geocode.new options[:google_api_key]
    else
      raise "Unsupported geocode service: #{service}"
    end
  end
  
  def geocode()
    raise NoMethodError.new("geocode(): Unimplemented method! Child class must override!")
  end

  def reverse_geocode()
    raise NoMethodError.new("reverse_geocode(): Unimplemented method! Child class must override!")
  end
end

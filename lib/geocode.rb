require File.expand_path(File.join(File.dirname(__FILE__), 'google', 'geocode'))
require File.expand_path(File.join(File.dirname(__FILE__), 'google', 'result'))

class Geocode
  def self.new_geocoder(service, options)
    case service
    when :google
      Google::Geocode.new options[:google_api_key], options[:client]
    else
      raise "Unsupported geocode service: #{service}"
    end
  end

  def geocode()
    raise "geocode(): Unimplemented method! Child class must override!"
  end

  def reverse_geocode()
    raise "reverse_geocode(): Unimplemented method! Child class must override!"
  end
end

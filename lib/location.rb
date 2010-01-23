require File.expand_path(File.join(File.dirname(__FILE__), 'numeric_degrad_conv'))
require File.expand_path(File.join(File.dirname(__FILE__), 'earth_constants'))

class Location
  
  attr_accessor :lat, :lng
  
  def initialize(lat, lng)
    @lat, @lng = lat, lng
  end

  def to_s
    "#{lat},#{lng}"
  end
  
  def ==(o)
    o.lat == lat && o.lng == lng
  end
  
  # Locations, by defalt, are "near" each other if both their lat and
  # lng are within 0.001 degrees, or about 110 meters. (111m per axis,
  # so a possible total deviance of about 157m along the diagonal.)
  def near?(o, delta=0.001)
    d = axis_distance(o)
    d.lat <= delta && d.lng <= delta
  end
  
  def axis_distance(o)
#    Location.new((o.lat-lat).abs, (o.lng-lng).abs)
    Location.new((o.lat-lat).abs % 360, (o.lng-lng).abs % 360)
#    Location.new(((o.lat%360)-(lat%360)).abs, ((o.lng%360)-(lng%360)).abs)
  end
  
  # TODO: Kill Google::Result class altogether, rename this to
  # Location, and have the Geocode classes return Location objects.
  
  # Calculate great circle distance to another location
  def distance_to(o)
    lat1, lng1, lat2, lng2 = [lat, lng, o.lat, o.lng].map {|l| l.to_rad }
    dlat = lat2 - lat1
    dlng = lng2 - lng1
    # Haversine formula found here: http://www.movable-type.co.uk/scripts/latlong.html
    r = EarthConstants::EARTH_RADIUS_METERS
    a = Math.sin(dlat/2)**2 + Math.cos(lat1)*Math.cos(lat2) * Math.sin(dlng/2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1.0-a))
    d = r * c
  end
  
  # Calculate initial bearing (forward azimuth) to another location. This is a compass bearing, where 0 = North and 90 = East.
  def bearing_to(o)
    lat1, lng1, lat2, lng2 = [lat, lng, o.lat, o.lng].map {|l| l.to_rad }
    dlat = lat2 - lat1
    dlng = lng2 - lng1
    Math.atan2(
               Math.sin(dlng) * Math.cos(lat2),
               Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(dlng)
               ).to_deg % 360
  end
  
  # calculate midpoint between this location and another
  # TODO: Once this is refactored to a Location class, return a Location instead of "lat.to_rad, lng.to_rad"
  def midpoint_to(o)
    lat1, lng1, lat2, lng2 = [lat, lng, o.lat, o.lng].map {|l| l.to_rad }
    
    dlat = lat2 - lat1
    dlng = lng2 - lng1
    bx = Math.cos(lat2) * Math.cos(dlng)
    by = Math.cos(lat2) * Math.sin(dlng)
    
    latm = Math.atan2(
                      Math.sin(lat1) + Math.sin(lat2),
                      Math.sqrt((Math.cos(lat1)+bx)**2 + by**2)
                      )
    lngm = lng1 + Math.atan2(by, Math.cos(lat1) + bx)

    Location.new(latm.to_deg, lngm.to_deg)
  end
end

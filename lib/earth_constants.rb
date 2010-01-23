module EarthConstants
  # IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT
  # 
  # If you check three different references you will get four
  # different values for the size of the Earth! It is CRITICAL that
  # you pick one constant and derive the others here, otherwise you're
  # going to have weird errors.
  # 
  # Note that these numbers are ALSO known to be wrong. The Earth is
  # an oblate spheroid, and these values are all calculated for
  # spheres. (Actually, it's not even an oblate spheroid! Mountains
  # and valleys perturb elevation on land, while tides and waves
  # perturb elevation at sea.)
  
  # Mean earth radius, in meters, at the equator.
  EARTH_RADIUS = 6_378_136.6
  EARTH_RADIUS_METERS = EARTH_RADIUS
  METERS_PER_MILE = 1_609.344
  
  EARTH_CIRCUMFERENCE = EARTH_RADIUS * 2.0 * Math::PI
  METERS_PER_DEGREE_LATITUDE = EARTH_CIRCUMFERENCE / 360.0
  
  EARTH_RADIUS_KM = EARTH_RADIUS / 1000.0

  # Burmese/Liberian/American units
  EARTH_RADIUS_MILES = EARTH_RADIUS / METERS_PER_MILE
  MILES_PER_DEGREE_LATITUDE = METERS_PER_DEGREE_LATITUDE / METERS_PER_MILE
  
end

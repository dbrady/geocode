class Numeric
  
  DEG_PER_RAD = 180.0 / Math::PI
  RAD_PER_DEG = Math::PI / 180.0
  
  def to_rad
    self * RAD_PER_DEG
  end
  
  def to_deg
    self * DEG_PER_RAD
  end
  
end


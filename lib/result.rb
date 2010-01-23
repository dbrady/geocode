class Result
  def success?; raise NoMethodError.new("success?(): Unimplemented method! Child class must override!") end
  def error?; raise NoMethodError.new("error?(): Unimplemented method! Child class must override!") end
  def dump; raise NoMethodError.new("dump(): Unimplemented method! Child class must override!") end
  def latlng; raise NoMethodError.new("latlng(): Unimplemented method! Child class must override!") end
  def lat; raise NoMethodError.new("lat(): Unimplemented method! Child class must override!") end
  def lng; raise NoMethodError.new("lng(): Unimplemented method! Child class must override!") end
  def address; raise NoMethodError.new("address(): Unimplemented method! Child class must override!") end
  def accuracy; raise NoMethodError.new("accuracy(): Unimplemented method! Child class must override!") end
  def viewport; raise NoMethodError.new("viewport(): Unimplemented method! Child class must override!") end
  def viewport_height; raise NoMethodError.new("viewport_height(): Unimplemented method! Child class must override!") end
end

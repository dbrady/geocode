require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe Location do
  before(:each) do
    @one_degree = EarthConstants::METERS_PER_DEGREE_LATITUDE
    @two_degrees = EarthConstants::METERS_PER_DEGREE_LATITUDE * 2.0

    
    # The test points are defined in even 1 degrees away from
    # greenwich (which is at 0,0), so north2 is at (2,0), east1 is at
    # (0,1), etc. "far" coordinates are equal to their near
    # equivalents, but by wrapping around the globe; e.g. east2 (0,2)
    # = fareast2 (0,-358).
    # 
    #                           north2    = +2 lat
    #                             ^
    #                             |
    #                             |
    #                           north1    = +1 lat
    #                             ^
    #                             |
    #                             |
    # west2 <---- west1 <---- greenwich ----> east1 ----> east2
    # -2 lng     -1 lng           |           +1 lng      +2 lng
    #                             |
    #                             v
    #                           south1    = -1 lat
    #                             |
    #                             |
    #                             v
    #                           south2    = -2 lat
    # 
    @greenwich = Location.new(0, 0)
    @north1 = Location.new(1.0, 0)
    @north2 = Location.new(2.0, 0)
    @south1 = Location.new(-1.0, 0)
    @south2 = Location.new(-2.0, 0)

    # far and near are equal; far wraps the globe.
    @east1 = Location.new(0, 1.0)
    @east2 = Location.new(0, 2.0)
    @fareast1 = Location.new(0, -359.0)
    @fareast2 = Location.new(0, -358.0)

    @west1 = Location.new(0, -1.0)
    @west2 = Location.new(0, -2.0)
    @farwest1 = Location.new(0, 359.0)
    @farwest2 = Location.new(0, 358.0)
  end

#   describe "#distance_to" do
#     it "should calculate distance in meters" do
#       dd = 0.001
#       @greenwich.distance_to(@north1).should be_close(@one_degree, dd)
#       @greenwich.distance_to(@north2).should be_close(@two_degrees, dd)
#       @greenwich.distance_to(@south1).should be_close(@one_degree, dd)
#       @greenwich.distance_to(@south2).should be_close(@two_degrees, dd)
      
#       @greenwich.distance_to(@east1).should be_close(@one_degree, dd)
#       @greenwich.distance_to(@east2).should be_close(@two_degrees, dd)
#       @greenwich.distance_to(@fareast1).should be_close(@one_degree, dd)
#       @greenwich.distance_to(@fareast2).should be_close(@two_degrees, dd)

#       @greenwich.distance_to(@west1).should be_close(@one_degree, dd)
#       @greenwich.distance_to(@west2).should be_close(@two_degrees, dd)
#       @greenwich.distance_to(@farwest1).should be_close(@one_degree, dd)
#       @greenwich.distance_to(@farwest2).should be_close(@two_degrees, dd)
#     end
#   end
  
#   describe "#bearing_to" do
#     it "should calculate bearing in degrees" do
#       db = 0.01
#       @greenwich.bearing_to(@north1).should be_close(0, db)
#       @greenwich.bearing_to(@east1).should be_close(90, db)
#       @greenwich.bearing_to(@fareast1).should be_close(90, db)
#       @greenwich.bearing_to(@west1).should be_close(270, db)
#       @greenwich.bearing_to(@farwest1).should be_close(270, db)
#       @greenwich.bearing_to(@south1).should be_close(180, db)

#       @greenwich.bearing_to(@north2).should be_close(0, db)
#       @greenwich.bearing_to(@east2).should be_close(90, db)
#       @greenwich.bearing_to(@fareast2).should be_close(90, db)
#       @greenwich.bearing_to(@west2).should be_close(270, db)
#       @greenwich.bearing_to(@farwest2).should be_close(270, db)
#       @greenwich.bearing_to(@south2).should be_close(180, db)
      
#       @north1.bearing_to(@east1).should be_close(135, db)
#       @north1.bearing_to(@west1).should be_close(225, db)
#       @north1.bearing_to(@fareast1).should be_close(135, db)
#       @north1.bearing_to(@farwest1).should be_close(225, db)
#       @north1.bearing_to(@south1).should be_close(180, db)

#       @east1.bearing_to(@north1).should be_close(315, db)
#       @east1.bearing_to(@west1).should be_close(270, db)
#       @east1.bearing_to(@farwest1).should be_close(270, db)
#       @east1.bearing_to(@south1).should be_close(225, db)
#       @fareast1.bearing_to(@north1).should be_close(315, db)
#       @fareast1.bearing_to(@west1).should be_close(270, db)
#       @fareast1.bearing_to(@farwest1).should be_close(270, db)
#       @fareast1.bearing_to(@south1).should be_close(225, db)
      
#       @west1.bearing_to(@north1).should be_close(45, db)
#       @west1.bearing_to(@east1).should be_close(90, db)
#       @west1.bearing_to(@fareast1).should be_close(90, db)
#       @west1.bearing_to(@south1).should be_close(135, db)
#       @farwest1.bearing_to(@north1).should be_close(45, db)
#       @farwest1.bearing_to(@east1).should be_close(90, db)
#       @farwest1.bearing_to(@fareast1).should be_close(90, db)
#       @farwest1.bearing_to(@south1).should be_close(135, db)

#       @south1.bearing_to(@north1).should be_close(0, db)
#       @south1.bearing_to(@east1).should be_close(45, db)
#       @south1.bearing_to(@west1).should be_close(315, db)
#       @south1.bearing_to(@fareast1).should be_close(45, db)
#       @south1.bearing_to(@farwest1).should be_close(315, db)
#     end 
#   end
  
  describe "#midpoint_to" do
    it "should return Location for midpoint" do
      dm = 0.001
      @greenwich.midpoint_to(@north2).should be_near(@north1, dm)
      @greenwich.midpoint_to(@south2).should be_near(@south1, dm)
      @greenwich.midpoint_to(@east2).should be_near(@east1, dm)
      @greenwich.midpoint_to(@west2).should be_near(@west1, dm)
      @greenwich.midpoint_to(@fareast2).should be_near(@fareast1, dm)
      @greenwich.midpoint_to(@farwest2).should be_near(@farwest1, dm)
      
      @north1.midpoint_to(@south1).should be_near(@greenwich, dm)
      @east1.midpoint_to(@west1).should be_near(@greenwich, dm)
      @west1.midpoint_to(@east1).should be_near(@greenwich, dm)
      @east1.midpoint_to(@farwest1).should be_near(@greenwich, dm)
      @west1.midpoint_to(@fareast1).should be_near(@greenwich, dm)
      @fareast1.midpoint_to(@west1).should be_near(@greenwich, dm)
      @farwest1.midpoint_to(@east1).should be_near(@greenwich, dm)
      @fareast1.midpoint_to(@farwest1).should be_near(@greenwich, dm)
      @farwest1.midpoint_to(@fareast1).should be_near(@greenwich, dm)
      @south1.midpoint_to(@north1).should be_near(@greenwich, dm)
    end
  end
  
end
  

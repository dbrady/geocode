require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe Numeric do
  describe 'to_rad' do
    it "should convert degrees to radians" do
      180.to_rad.should be_close(Math::PI, 0.000001)
      180.0.to_rad.should be_close(Math::PI, 0.000001)
    end
  end
  
  describe "to_deg" do
    it "should convert radians to degrees" do
      Math::PI.to_deg.should be_close(180.0, 0.000001)
      (Math::PI * 3 / 2).to_deg.should be_close(270.0, 0.000001)
    end
  end
end

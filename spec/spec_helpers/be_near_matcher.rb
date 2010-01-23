# Passes in location A is within ~157m of location B (both lat and lng
# are within 0.001 degrees of each other)
class BeNear
  def initialize(expected, delta=0.001)
    @expected = expected
    @delta = 0.001
  end

  def matches?(actual)
    @actual = actual
    @expected.near?(@actual, @delta)
  end

  def failure_message
    "expected Location(#{@expected}) to be within #{@delta} degrees per axis of Location(#{@actual}), but it wasn't. (axis distance: #{@actual.axis_distance(@expected)})"
  end

  def negative_failure_message
    "expected Location(#{@expected}) to not be within #{@delta} degrees per axis of Location(#{@actual}), but it was.  (axis distance: #{@actual.axis_distance(@expected)})"
  end
end

# Succeeds if actual is truthy.
def be_near(expected, delta=0.001)
  BeNear.new(expected, delta)
end


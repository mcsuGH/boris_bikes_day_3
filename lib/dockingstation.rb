require_relative 'bike'

class DockingStation 
  attr_reader :bike
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.shift
  end

  def dock(bike)
    fail 'Dock full' if full?
    @bikes << bike
    @bike = bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count == 0
  end
end

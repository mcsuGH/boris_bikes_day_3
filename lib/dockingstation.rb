require_relative 'bike'

class DockingStation 
  attr_reader :bike
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
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

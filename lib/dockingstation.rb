require_relative 'bike'

class DockingStation 
  attr_reader :bikes
  attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.shift
  end

  def dock(bike)
    fail 'Dock full' if @bikes.count >= 20
    @bikes << bike
    @bike = bike
  end
end

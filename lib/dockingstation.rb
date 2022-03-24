require_relative 'bike'

class DockingStation 
  attr_reader :bike
  attr_reader :capacity
  attr_reader :working_bikes
  attr_reader :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
 
  end

  def release_bike
    fail 'No bikes available' if any_working_bikes?
    @working_bikes.shift
  end

  def dock(bike, working = true)
    fail 'Dock full' if full?
    if bike.working == true
      @working_bikes << bike
    else
      @broken_bikes << bike
    end
    @bike = bike
  end

  def spaces_left
    @capacity - @working_bikes.count - @broken_bikes.count
  end

  private

  def full?
    @working_bikes.count + @broken_bikes.count >= @capacity
  end

  def any_working_bikes?
    @working_bikes.count == 0
  end

end

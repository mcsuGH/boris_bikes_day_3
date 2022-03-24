require_relative 'bike'

class Garage

  def initialize
    @broken_bikes = []
    @repaired_bikes =[]
  end

  def take_bikes(array)

  end

  def repair_bike(bike)
    bike.working = true
  end

  def distribute_bikes
  end
end


    
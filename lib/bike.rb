class Bike
attr_reader :working
  def initialize(working = true)
    @working = working
  end

  def working?
    if @working == true
      return true
    else
      return false
    end
  end
end
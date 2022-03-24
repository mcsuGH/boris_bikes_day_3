class Bike
attr_accessor :working

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
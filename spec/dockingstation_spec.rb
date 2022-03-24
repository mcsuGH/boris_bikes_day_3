require 'dockingstation'

describe DockingStation do 
  it 'Releases a bike' do
    docking_station = DockingStation.new
    bike = Bike.new
    expect(bike).to respond_to :working?
    expect(docking_station).to respond_to :release_bike
  end 

  it 'Docks a bike' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.docking_bike(bike)
    expect(docking_station.bike).to eq bike
  end
end

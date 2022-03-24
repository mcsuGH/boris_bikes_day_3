require 'dockingstation'

describe DockingStation do 
  it 'Releases a bike and checks bike is working' do
    bike = Bike.new
    expect(bike).to respond_to :working?
    expect(subject).to respond_to :release_bike
  end 

  it 'Docks a bike' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.bike).to eq bike
  end

   describe '#release_bike' do
     it 'Should not give a bike when docking station empty' do
       expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'Should not accept bike if dock full' do
      DockingStation::DEFAULT_CAPACITY.times do subject.dock(Bike.new) end
      expect { subject.dock(Bike.new) }.to raise_error 'Dock full'
    end
  end

  it "Should be able to have a capacity of 30" do
    docking_station = DockingStation.new(30)
    expect(docking_station.capacity).to eq 30
  end

  it "Should default to a capacity of 20" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end

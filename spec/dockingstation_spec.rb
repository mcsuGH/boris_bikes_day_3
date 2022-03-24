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
      20.times do subject.dock(Bike.new) end
      expect { subject.dock(Bike.new) }.to raise_error 'Dock full'
    end
  end
end

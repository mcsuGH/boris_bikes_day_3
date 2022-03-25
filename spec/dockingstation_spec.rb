require 'dockingstation'

describe DockingStation do 

  it 'Releases a bike and checks bike is working' do
    subject.dock(double(:working => true))
    released_bike = subject.release_bike
    expect(released_bike.working).to eq true
  end 

  it 'Docks a bike' do
    bike = double(:working => false)
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

   describe '#release_bike' do
     it 'Should not give a bike when docking station empty' do
       expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'Should not accept bike if dock full' do
      DockingStation::DEFAULT_CAPACITY.times do subject.dock(double(:working => true)) end
      expect { subject.dock(double) }.to raise_error 'Dock full'
    end
  end

  it "Should be able to have a capacity of 30" do
    docking_station = DockingStation.new(30)
    expect(docking_station.capacity).to eq 30
  end

  it "Should default to a capacity of 20" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'Should let me report a broken bike when returning it' do
    bike = double(:working => false)
    expect(subject.dock(bike)).to eq bike
  end

  it 'Docking station does not release broken bikes' do
    subject.dock(double(:working => false))
    subject.dock(double(:working => true))
    expect(subject.release_bike.working).to eq true
  end

  it 'Docking station receives all bikes broken or not' do
    subject.dock(double(:working => false))
    expect(subject.spaces_left).to eq 19
  end
end

require 'dockingstation'

describe DockingStation do 
  let(:bike) { double :bike }
  let(:bike2) { double :bike }
  it 'Releases a bike and checks bike is working' do
    allow(bike).to receive(:working).and_return(true)
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike.working).to eq true
  end 

  it 'Docks a bike' do
    docking_station = DockingStation.new
    allow(bike).to receive(:working).and_return(false)
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
      allow(bike).to receive(:working).and_return(true)
      DockingStation::DEFAULT_CAPACITY.times do subject.dock(bike) end
      expect { subject.dock(bike) }.to raise_error 'Dock full'
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
    allow(bike).to receive(:working).and_return(false)
    expect(subject.dock(bike)).to eq bike
  end

  it 'Docking station does not release broken bikes' do
    allow(bike).to receive(:working).and_return(false)
    subject.dock(bike)
    allow(bike2).to receive(:working).and_return(true)
    subject.dock(bike2)
    expect(subject.release_bike.working).to eq true
  end

  it 'Docking station receives all bikes broken or not' do
    allow(bike).to receive(:working).and_return(false)
    subject.dock(bike)
    expect(subject.spaces_left).to eq 19
  end
end

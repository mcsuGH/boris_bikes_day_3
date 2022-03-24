require 'garage'

describe Garage do
    it { is_expected.to respond_to :take_bikes }

    it 'Garage takes the bikes' do
    end

    it { is_expected.to respond_to :repair_bike }

    it 'Garage repairs bike' do
        bike = Bike.new(false)
        subject.repair_bike(bike)
        expect(bike).to be_working
    end

    it { is_expected.to respond_to :distribute_bikes }
end
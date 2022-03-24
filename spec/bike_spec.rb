require 'bike'

describe Bike do
  it 'Bike Working' do
    bike = Bike.new
    expect(bike).to respond_to :working?
  end
end
    
require 'ship'

RSpec.describe Ship do
  it 'it initializes correctly' do
    ship_size = 2
    expect(
      Ship.new(ship_size)
    ).to be
  end
end
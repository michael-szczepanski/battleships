require 'ship'

RSpec.describe Ship do
  it 'it initializes correctly' do
    ship_size = 2
    position = [0,0]
    orientation = "horizontal"
    expect(
      Ship.new(ship_size, position, orientation)
    ).to be
  end
end
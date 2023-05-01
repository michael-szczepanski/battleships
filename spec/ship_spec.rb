# frozen_string_literal: true

require './lib/ship'

RSpec.describe Ship do
  it 'it initializes correctly' do
    ship_size = 2
    position = [0, 0]
    horizontal = true
    expect(
      Ship.new(ship_size, position, horizontal)
    ).to be
  end
end

# frozen_string_literal: true

class Ship
  attr_reader :position, :horizontal, :sizes
  attr_accessor :hit_points

  def initialize(ship_size, position, _horizontal)
    @size = ship_size
    @position = position
    @horizontal = true
    @hit_points = ship_size
  end

  def to_s
    @size.to_s
  end
end

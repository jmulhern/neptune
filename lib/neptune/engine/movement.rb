# frozen_string_literal: true

require 'gosu'

module Engine
  class Movement
    attr_accessor :x, :y

    def initialize(x = 0, y = 0)
      @x = x
      @y = y
    end

    def accelerate(angle, magnitude = 0.5)
      @x += Gosu.offset_x(angle, magnitude)
      @y += Gosu.offset_y(angle, magnitude)
    end

    def decelerate
      @x *= 0.95
      @y *= 0.95
    end
  end
end

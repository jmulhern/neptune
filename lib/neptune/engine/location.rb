# frozen_string_literal: true

module Engine
  class Location
    attr_accessor :x, :y

    def initialize(x = 0, y = 0)
      @x = x
      @y = y
    end
  end
end

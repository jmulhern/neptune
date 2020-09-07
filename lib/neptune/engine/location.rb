# frozen_string_literal: true

module Engine
  # rubocop:disable Naming/MethodParameterName
  class Location
    attr_reader :x, :y

    def initialize(x = 0, y = 0)
      @x = x
      @y = y
    end
  end
  # rubocop:enable Naming/MethodParameterName
end

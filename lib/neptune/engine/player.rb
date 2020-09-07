# frozen_string_literal: true

require 'gosu'
require './lib/neptune/engine/location'

module Engine
  class Player
    attr_reader :asset, :image, :location

    TURN_FACTOR = 4.5

    def initialize(asset)
      @asset = asset
      @image = Gosu::Image.new(@asset.path)
      @location = Engine::Location.new
      @z_index = 1
      @angle = 0.0
    end

    def warp(x, y)
      @location.x = x
      @location.y = y
    end

    def turn_left
      @angle -= TURN_FACTOR
    end

    def turn_right
      @angle += TURN_FACTOR
    end

    def draw
      @image.draw_rot(@location.x, @location.y, @z_index, @angle)
    end
  end
end

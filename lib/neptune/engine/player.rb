# frozen_string_literal: true

require 'gosu'
require './lib/neptune/engine/location'
require './lib/neptune/engine/movement'

module Engine
  class Player
    attr_reader :asset, :image, :location

    TURN_FACTOR = 4.5

    def initialize(asset)
      @asset = asset
      @image = Gosu::Image.new(@asset.path)
      @location = Engine::Location.new
      @movement = Engine::Movement.new
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

    def forward
      @movement.accelerate(@angle)
    end

    def move(max_x = 0, max_y = 0)
      @location.x += @movement.x
      @location.y += @movement.y
      @location.x %= max_x if max_x.positive?
      @location.y %= max_y if max_y.positive?
      @movement.decelerate
    end

    def draw
      @image.draw_rot(@location.x, @location.y, @z_index, @angle)
    end
  end
end

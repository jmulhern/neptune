# frozen_string_literal: true

require 'gosu'
require './lib/neptune/engine/location'

module Engine
  class Player
    attr_reader :asset, :image, :location

    def initialize(asset)
      @asset = asset
      @image = Gosu::Image.new(@asset.path)
      @location = Engine::Location.new
    end

    def warp(x, y)
      @location.x = x
      @location.y = y
    end

    def draw
      @image.draw_rot(@location.x, @location.y, 1, 0.0)
    end
  end
end

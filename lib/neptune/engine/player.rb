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
  end
end

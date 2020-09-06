# frozen_string_literal: true

module Engine
  class Player
    attr_reader :asset, :image

    def initialize(asset)
      @asset = asset
      @image = Gosu::Image.new(@asset.path)
    end
  end
end

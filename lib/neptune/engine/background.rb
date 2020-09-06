# frozen_string_literal: true

require 'gosu'

module Engine
  class Background
    attr_reader :asset, :image

    def initialize(asset)
      @asset = asset
      @image = Gosu::Image.new(@asset.path, tileable: true)
    end

    def draw(min_width: 0, min_height: 0, scale: 1)
      y_offset = 0
      until y_offset >= min_height && y_offset.positive?
        x_offset = 0
        until x_offset >= min_width && x_offset.positive?
          @image.draw(x_offset, y_offset, 0, scale, scale)
          x_offset += asset.width * scale
        end
        y_offset += asset.height * scale
      end
    end
  end
end

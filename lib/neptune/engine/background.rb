# frozen_string_literal: true

require 'gosu'

module Engine
  class Background
    attr_reader :asset, :image

    def initialize(asset, min_width: 0, min_height: 0, z_index: 0, scale: 1)
      @asset = asset
      @image = Gosu::Image.new(@asset.path, tileable: true)
      @min_width = min_width
      @min_height = min_height
      @z_index = z_index
      @x_scale = @y_scale = scale
    end

    def draw
      y_offset = 0
      until y_offset >= @min_height && y_offset.positive?
        x_offset = 0
        until x_offset >= @min_width && x_offset.positive?
          @image.draw(x_offset, y_offset, @z_index, @x_scale, @y_scale)
          x_offset += asset.width * @x_scale
        end
        y_offset += asset.height * @y_scale
      end
    end
  end
end

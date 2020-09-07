# frozen_string_literal: true

require './lib/neptune/engine/image'

module Assets
  module Images
    BACKGROUND = Engine::Image.new(
      path: File.join('assets', 'images', 'Space', 'Space_Stars2.png'),
      width: 64,
      height: 64
    )
    RED_SHIP = Engine::Image.new(
      path: File.join('assets', 'images', 'PixelSpaceRage', 'PlayerRed_Frame_01_png_processed.png'),
      width: 64,
      height: 64
    )
  end
end

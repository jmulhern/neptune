# frozen_string_literal: true

require './lib/neptune/engine/image'

module Assets
  # rubocop:disable Metrics/MethodLength
  def self.images(name)
    {
      background:
        Engine::Image.new(
          path: File.join('assets', 'images', 'Space', 'Space_Stars2.png'),
          width: 64,
          height: 64
        ),
      red_ship:
        Engine::Image.new(
          path: File.join('assets', 'images', 'PixelSpaceRage', 'PlayerRed_Frame_01_png_processed.png'),
          width: 64,
          height: 64
        )
    }[name]
  end
  # rubocop:enable Metrics/MethodLength
end

# frozen_string_literal: true

require './lib/neptune/engine/image'

module Assets
  def self.images(name)
    {
      background:
        Engine::Image.new(
          path: File.join('assets', 'images', 'Space', 'Space_Stars2.png'),
          width: 64,
          height: 64
        )
    }[name]
  end
end

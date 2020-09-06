# frozen_string_literal: true

require './lib/neptune/engine/window'
require './lib/neptune/engine/background'
require './lib/neptune/game/assets'

class Window < Engine::Window
  WIDTH = 640
  HEIGHT = 480
  CAPTION = "Neptune - v#{Neptune::VERSION}"

  def initialize
    super width: WIDTH, height: HEIGHT, caption: CAPTION
    @background = Engine::Background.new(Assets.images(:background))
  end

  def draw
    @background.draw(min_width: WIDTH, min_height: HEIGHT, scale: 1.5)
  end
end

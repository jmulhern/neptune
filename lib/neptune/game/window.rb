# frozen_string_literal: true

require './lib/neptune/engine/window'
require './lib/neptune/engine/background'
require './lib/neptune/engine/player'
require './lib/neptune/assets/images'

class Window < Engine::Window
  WIDTH = 800
  HEIGHT = 600
  CAPTION = "Neptune - v#{Neptune::VERSION}"

  def initialize
    super width: WIDTH, height: HEIGHT, caption: CAPTION
    @background = Engine::Background.new(
      Assets::Images::BACKGROUND,
      min_width: WIDTH,
      min_height: HEIGHT,
      scale: 1.75
    )
    @player = Engine::Player.new(Assets::Images::RED_SHIP)
  end

  def draw
    @background.draw
  end
end

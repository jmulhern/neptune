# frozen_string_literal: true

require './lib/neptune/engine/window'
require './lib/neptune/engine/background'
require './lib/neptune/engine/player'
require './lib/neptune/engine/input'
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
      scale: 1.25
    )
    @player = Engine::Player.new(Assets::Images::RED_SHIP)
    @player.warp(WIDTH / 2, HEIGHT / 2)
  end

  def update
    @player.turn_left if Engine::Input.left?
    @player.turn_right if Engine::Input.right?
    @player.forward if Engine::Input.up?
    @player.move(WIDTH, HEIGHT)
  end

  def draw
    @player.draw
    @background.draw
  end
end

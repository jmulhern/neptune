# frozen_string_literal: true

require './lib/neptune/engine/window'

class Window < Engine::Window
  WIDTH = 640
  HEIGHT = 480
  CAPTION = "Neptune - v#{Neptune::VERSION}"

  def initialize
    super width: WIDTH, height: HEIGHT, caption: CAPTION
  end
end

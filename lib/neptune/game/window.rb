# frozen_string_literal: true

require './lib/neptune/engine/window'

class Window < Engine::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super WIDTH, HEIGHT
  end
end

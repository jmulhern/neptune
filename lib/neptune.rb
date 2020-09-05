# frozen_string_literal: true

require './lib/neptune/version'
require './lib/neptune/game/window'

module Neptune
  class Error < StandardError; end

  def self.init
    window = Window.new
    window.show
  end
end

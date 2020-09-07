# frozen_string_literal: true

require 'gosu'

module Engine
  module Input
    def self.left?
      Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::GP_LEFT)
    end

    def self.right?
      Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::GP_RIGHT)
    end

    def self.up?
      Gosu.button_down?(Gosu::KB_UP) || Gosu.button_down?(Gosu::GP_UP)
    end
  end
end

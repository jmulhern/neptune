# frozen_string_literal: true

require 'gosu'

module Engine
  class Window < Gosu::Window
    attr_reader :width, :height, :args

    def initialize(width, height, *args)
      @width = width
      @height = height
      @args = args
      super(width, height, *args)
    end
  end
end

# frozen_string_literal: true

require 'gosu'

module Engine
  class Window < Gosu::Window
    attr_reader :width, :height, :caption

    def initialize(height:, width:, caption:)
      @width = width
      @height = height
      @caption = caption
      super(width, height)
      self.caption = @caption
    end
  end
end
